class UsersController < ApplicationController
  before_filter :authenticate, except: [:show, :new, :create]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user,   only: :destroy
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def index
    @title = "All users"
    @users = User.all
  end
  
  def show
    @user = User.find_by_url(params[:id])
    @title = @user.name
    @rep = Topic.where(user_id: @user.id).sum(:score) 
    @topics = @user.topics.all
    @showoptions = false
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find_by_url(params[:id])
    @users = @user.following.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by_url(params[:id])
    @users = @user.followers.all
    render 'show_follow'
  end
  
  def destroy
    User.find_by_url(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
    
    def correct_user
      @user = User.find_by_url(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
