class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    @posts = @user.posts
    @comments = @user.comments
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def user_posts
    @user = User.find_by_username(params[:username])
    @posts = @user.posts
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
