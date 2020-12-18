class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      redirect_to request.referrer, notice: 'Comment added.'
    else
      redirect_to request.referrer, alert: 'Comment could not be added at this time.'
    end
  end

  def update
    # @friendship = Friendship.find(params[:id])

    # if @friendship.update(pending: false)
    #   flash.notice = "You are now friends with #{@friendship.user.first_name}"
    #   redirect_to user_path(@friendship.user_id)
    # else
    #   flash.alert = "Friendship could not be saved."
    #   redirect_to root_path
    # end
  end

  def destroy
    @comment = Comment.find(comments_params[:id])
    @comment.destroy

    redirect_to request.referrer, notice: 'Comment was successfully destroyed.'
  end

  private

  def comments_params
    params.require(:comment).permit(:id, :comment_body, :commentable_type, :commentable_id)
  end
end
