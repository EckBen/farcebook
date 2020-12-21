class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.viewable_content
    @friends = current_user.list_of_friends
    @textpost = current_user.text_posts.build
    @comment = current_user.comments.build
  end

  def show
    if params[:type] == "PicturePost"
      @post = PicturePost.find(params[:id])
    else params[:type] == "TextPost"
      @post = TextPost.find(params[:id])
    end

    @comment = Comment.new
  end

  def new
    @textpost = current_user.text_posts.build
    @picturepost = current_user.picture_posts.build
    @type = post_params[:type]
  end

  def create
    if params[:text_post]
      @textpost = current_user.text_posts.build(post_body: text_params[:post_body])
      @picturepost = current_user.picture_posts.build
      @type = "TextPost"
    else
      @textpost = current_user.text_posts.build
      @picturepost = current_user.picture_posts.build(picture_params)
      @type = "PicturePost"
    end

    if @textpost.save
      if (text_params[:main])
        redirect_to root_path, notice: 'Post was successfully created.'
      else
        redirect_to post_path(id: @textpost.id, type: @textpost.class.name), notice: 'Post was successfully created.'
      end
    elsif @picturepost.save
      redirect_to post_path(id: @picturepost.id, type: @picturepost.class.name), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if post_params[:type] == "PicturePost"
      @post = PicturePost.find(post_params[:id])
    else
      @post = TextPost.find(post_params[:id])
    end
    
    @post.destroy

    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:id, :type)
  end

  def text_params
    params.require(:text_post).permit(:post_body, :main)
  end

  def picture_params
    params.require(:picture_post).permit(:picture_title, :picture_body, :picture_url)
  end
end
