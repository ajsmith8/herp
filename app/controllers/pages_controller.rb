class PagesController < ApplicationController
  
  def home
    @title = "Home"
    @topic = Topic.new
  end
  
  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def taglist
    @title = "All Tags"
    @tags = Tag.find(:all, group: "content")
  end
  
  def topicdiscovery
    @temp = Array.new
    hur = Array.new
    @final = Array.new
    @dur = Topic.at_depth(0)
    useractivity = Activity.where(user_id: current_user.id)
    
    useractivity.each do |i|
      hur.push i.topic_id
    end
   
    @dur.each do |i|
      if !hur.include?(i.id)
        @temp.push rand(10)*1000*i.clicks/i.display_count
      else
        @temp.push 0
      end
    end
    @durr = @temp.sort.reverse
    
    i = 0
    while i < 5
      foo = @temp.index(@durr[i])
      if @durr[i] > 0
        @final.push @dur[foo] 
        @dur[foo].display_count += 1
        @dur[foo].save      
      end
      i += 1
    end 
  end
  
#  def topiclist
#    @title = "All Topics"
#    @topic = Topic.new
#    @topics = Topic.paginate(:page => params[:page])
#  end
end
