class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @current_friends = current_user.list_of_friends
    @pending_friends = current_user.list_of_friends("pending")
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def user_params
  #   params.require(:user).permit(:post_title, :post_body, :tag_list)
  # end
end
