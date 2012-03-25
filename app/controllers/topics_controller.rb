class TopicsController < ApplicationController
  before_filter :authenticate, only: [:create, :destroy, :update]
  before_filter :authorized_user, only: [:destroy]
  
  def new
    @topic = Topic.new
    @title = "Make me a topic"
  end
  
  def create
    @topic = Topic.new(params[:topic])
    @topic.pro_fieldname = "Supporting Reasons:"
    @topic.con_fieldname = "Opposing Reasons"
    @topic.user_id = current_user.id
    @topic.display_count = 1
    @topic.clicks = 1
    @topic.score = 1
    scoring = @topic.scorings.build(vote: 1, user_id: current_user.id)
    #@topic.content.capitalize!
    if @topic.save
      current_user.bookmarks.build(topic_id: @topic.id).save if @topic.ancestry_depth == 0
      current_user.activities.build(topic_id: @topic.id).save
      if @topic.depth == 0
        redirect_to topics_path
      else
        redirect_to @topic.parent
      end
    else
      redirect_to root_path
    end
  end
  
  def show
    @topic = Topic.find_by_url(params[:id])
    @suggestededit = Suggestededit.new
    @newtopic = Topic.new(parent_id: @topic.id)
    @nested = @topic.subtree(at_depth: 1)
   
    @proargs = @nested.where(ispro: true)
    @conargs = @nested.where(ispro: false)
    
    if !@proargs.empty?
      @proargs.sort! { |a,b| a.score <=> b.score}
      @proargs.reverse!  
    end
    
    unless @conargs.empty? 
      @conargs.sort! { |a,b| a.score <=> b.score}
      @conargs.reverse!
    end
    
    @parent = @topic.parent
    @link = trancate @parent.content unless @parent.nil?
    
    @comments = @topic.comments
    @procomments = @comments.where(ispro: true)
    @concomments = @comments.where(ispro: false)
    
    @procomments.sort! { |a,b| a.score <=> b.score}
    @procomments.reverse!   
    @concomments.sort! { |a,b| a.score <=> b.score}
    @concomments.reverse!
    
    @newcomment = Comment.new(topic_id: @topic.id)
    @tag = Tag.new
    if @topic.clicks.nil?
      @topic.clicks = 1
    else
      @topic.clicks += 1
    end
    @topic.save
    
    unless current_user.nil?
      if @topic.depth == 0
        if Activity.where(topic_id: @topic.id, user_id: current_user.id).count == 0
          @activity = Activity.new(user_id: current_user.id, topic_id: @topic.id).save
        end
      end
    end
    
    @showoptions = true
    
    @topicsuggestions = Array.new
    usertopicclicks = Array.new
    potentialtopicids = Array.new
    randomarray = Array.new
    originalarray = Array.new
    alltopics = Topic.at_depth(0)
    
    useractivity = Activity.where(user_id: current_user.id)
    
    useractivity.each do |i|
      usertopicclicks.push i.topic_id
    end
    
    alltopics.each do |i|
      random = rand(1000)
      if !usertopicclicks.include?(i.id)
        potentialtopicids.push i.id
        randomarray.push random
        originalarray.push random
      end
    end
    
    randomarray.sort!
    
    i = 0
    while i < 5
      foo = originalarray.index(randomarray[i])
      break if foo.nil? 
      @topicsuggestions.push Topic.find_by_id(potentialtopicids[foo]) 
      i += 1
    end
    
    @notopics = "No more main topics to discover. You've clicked through all the main topics...that's really impressive!"
    
  end
  
  def index
    @title = "All topics"
    @topic = Topic.new
    #@topics = Topic.paginate(:page => params[:page])
    @topics = Topic.at_depth(0)
  end
  
  def edit
    @title = "Edit topics"
    @topic = Topic.find_by_url(params[:id])
  end
  
  def update
    @topic = Topic.find_by_url(params[:id])
    if current_user.admin?
      if @topic.update_attributes(params[:topic])
        redirect_to @topic
      else redirect_to root
      end
    else  
      @temptopic = current_user.topics.find_by_url(params[:id])
      if !@temptopic.nil?
        if @temptopic.update_attributes(params[:topic])
          redirect_to @temptopic
        else redirect_to root
        end
      else
        temp = params[:topic]
        @topic.description = temp['description']
        @topic.save
        redirect_to @topic
      end
    end
  end
  
  def destroy   
    topic = Topic.find_by_url(params[:id])
    Bookmark.where(topic_id: topic.id).destroy_all  
    parent = topic.parent
    if current_user.admin? || topic.children.empty?
      topic.destroy
    end
    if topic.parent.nil?
      redirect_to topics_path
    else  
      redirect_to parent
    end
  end
  
  def trancate(string, length = 25)
    string.size > length+5 ? [string[0,length],string[-7,7]].join("...") : string
  end
  
  private
  
    def authorized_user
      unless current_user.admin?
        @topic = current_user.topics.find_by_url(params[:id])
        redirect_to root_path if @topic.nil?
      end
    end
end
