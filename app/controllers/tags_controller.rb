class TagsController < ApplicationController
  before_filter :authenticate, only: [:create, :destroy]
  before_filter :authorized_user, only: :destroy  
  
  def index
    @title = "All Tags"
    @tags = Tag.find(:all, group: "content")
    @searchtags = Tag.order(:content).where(["content like ?", "%#{params[:term]}%"])
    render json: @searchtags.map(&:content)
  end
  
  def show
    @tag = Tag.find_by_url(params[:id])
    @temp = Tag.find(:all, conditions: [ "lower(content) = ?", @tag.content.downcase])
  end
  
  def create
    @tag = Tag.new(params[:tag])
    @topic = Topic.find_by_id(@tag.topic_id)
    if Tag.find(:all, conditions: [ "lower(content) = ? and topic_id = ?", 
      @tag.content.downcase, @tag.topic_id]).count == 0
      @tag.content.capitalize!
      @tag.save
    end
    redirect_to @topic
  end
  
  def destroy   
    tag = Tag.find_by_url(params[:id])
    @topic = Topic.find_by_id(tag.topic_id)
    tag.destroy    
    redirect_to @topic
  end
  
  private
  
    def authorized_user
      unless current_user.admin?
        @topic = current_user.topics.find_by_id(params[:id])
        redirect_to root_path if @topic.nil?
      end
    end
end
