class ScoringsController < ApplicationController
  before_filter :authenticate

  def create
    @scoring = Scoring.new(params[:scoring])
    temp = Scoring.where(topic_id: @scoring.topic_id, user_id: @scoring.user_id).first
    if temp.nil?
      @scoring.save
    else
      temp.vote = @scoring.vote
      temp.save
    end
    @topic = Topic.find_by_id(@scoring.topic_id)
    @topic.score = Scoring.where(topic_id: @topic.id).sum(:vote)
    @topic.save
    parent = @topic.parent
    @nestedtopics = parent.subtree(at_depth: 1)
    @user = User.find_by_id(@scoring.user_id)
    
    respond_to do |format|
      format.html { redirect_to parent }
      format.js
    end
  end

end
