class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.viewable_content
    @friends = current_user.list_of_friends
  end

  def show
    
  end

  def new
    
  end

  def create
    
  end
end
