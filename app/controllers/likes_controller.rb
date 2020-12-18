class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(likely_params)

    if @like.save
      redirect_to request.referrer, notice: 'Liked successfully.'
    else
      redirect_to request.referrer, alert: 'Like could not be saved.'
    end
  end

  def destroy
    @like = current_user.likes.where("likeable_type = ? AND likeable_id = ?", likely_params[:likeable_type], likely_params[:likeable_id]).first
    @like.destroy

    redirect_to request.referrer, notice: 'Unliked successfully.'
  end

  private

  def likely_params
    params.require(:likes).permit(:likeable_type, :likeable_id)
  end
end