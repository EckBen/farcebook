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
    @comment = Comment.find(params[:id])

    @comment.update(seen: true)
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
