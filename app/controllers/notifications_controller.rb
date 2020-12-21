class NotificationsController < ApplicationController
  def routing
    if routing_params[:type] == "Comment"
      @activity = Comment.find(routing_params[:id])

      while @activity.commentable_type == "Comment"
        @activity = @activity.commentable
      end

      redirect_to post_path(@activity)
    else
      redirect_to post_path(id: routing_params[:id], type: routing_params[:type])
    end
  end

  private

  def routing_params
    params.require(:activity).permit(:id, :type)
  end
end
