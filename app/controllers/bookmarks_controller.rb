class BookmarksController < ApplicationController
  before_filter :authenticate

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.save
    @user = User.find(@bookmark.user_id)
    @topic = Topic.find_by_id(@bookmark.topic_id)
    @newtopic = Topic.new(parent_id: @topic.id)
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find_by_id(@bookmark.topic_id)
    @user = User.find(@bookmark.user_id)
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end
  
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @topics = Array.new
    @bookmarks.each do |i|
      @topics.push Topic.find_by_id(i.topic_id)
    end
  end
end
