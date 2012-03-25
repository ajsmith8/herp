class CommentsController < ApplicationController
  before_filter :authenticate, only: [:create, :destroy]
  before_filter :authorized_user, only: :destroy  
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.score = 1
    @comment.user_id = current_user.id
    scoring = @comment.commentscorings.build(vote: 1, user_id: current_user.id, topic_id: @comment.topic_id)
    @topic = Topic.find_by_id(@comment.topic_id)
    if @comment.save
      redirect_to @topic
    else
      redirect_to root_path
    end
  end
  
  def destroy   
    comment = Comment.find(params[:id])
    @topic = Topic.find_by_id(comment.topic_id)
    comment.destroy    
    redirect_to @topic
  end
  
  def edit
    @title = "Edit comment"
    @comment = Comment.find_by_id(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @topic = Topic.find_by_id(@comment.topic_id)
    if @comment.update_attributes(params[:comment])
      redirect_to @topic
    else
      redirect_to root
    end
  end
  
  private
  
    def authorized_user
      unless current_user.admin?
        @topic = current_user.topics.find_by_id(params[:id])
        redirect_to root_path if @topic.nil?
      end
    end
end
