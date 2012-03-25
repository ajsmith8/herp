class CommentscoringsController < ApplicationController
  before_filter :authenticate

  def create
    @scoring = Commentscoring.new(params[:commentscoring])
    temp = Commentscoring.where(comment_id: @scoring.comment_id, user_id: @scoring.user_id).first
    if temp.nil?
      @scoring.save
    else
      temp.vote = @scoring.vote
      temp.save
    end
    @comment = Comment.find_by_id(@scoring.comment_id)
    @topic = Topic.find_by_id(@comment.topic_id)
    @comment.score = Commentscoring.where(comment_id: @comment.id).sum(:vote)
    @comment.save
    @nestedcomments = @topic.comments
    @user = User.find_by_id(@scoring.user_id)
    
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end

end
