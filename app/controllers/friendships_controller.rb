class FriendshipsController < ApplicationController
  def create
    @new_friendship = current_user.friendships.build(friend_id: friendly_params[:id])
    
    if @new_friendship.save
      redirect_to users_path, notice: 'Friend request sent.'
    else
      redirect_to users_path, alert: 'Friend request could not be sent.'
    end
  end

  def update
    @friendship = Friendship.find(params[:id])

    if @friendship.update(pending: false)
      flash.notice = "You are now friends with #{@friendship.user.first_name}"
      redirect_to user_path(@friendship.user_id)
    else
      flash.alert = "Friendship could not be saved."
      redirect_to root_path
    end
  end

  def destroy
    @friendship = Friendship.where("friend_id = ? AND user_id = ?", friendly_params[:id], current_user.id).or(Friendship.where("friend_id = ? AND user_id = ?", current_user.id, friendly_params[:id])).first
    @friendship.destroy

    redirect_to users_path, notice: 'Friendship was successfully destroyed.'
  end

  private

  def friendly_params
    params.require(:user).permit(:id)
  end
end
