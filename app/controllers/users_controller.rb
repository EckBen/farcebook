class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
    @users = User.all
    @current_friends = current_user.list_of_friends
    @pending_friends = current_user.list_of_friends("pending")
  end

  def show
    @current_friends = current_user.list_of_friends
    @pending_friends = current_user.list_of_friends("pending")
    @content = @user.content
    @comment = Comment.new
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
