class FriendshipsController < ApplicationController
  def create
    @user_two = User.find(params[:user_two_id])
    @friendship = Friendship.create(user_one: current_user, user_two: @user_two, status: "pending")
    if @friendship.save!
      flash[:notice] = "You sent a friendship request to #{@user_two.first_name}"
      redirect_to users_path
    else
      flash[:notice] = "You failed to send a friendship request to #{@user_two.first_name}"
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(status: "accepted")
    flash[:notice] = "You accepted the friendship request from #{@friendship.user_one.first_name}"
    redirect_to chatrooms_path
  end
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    redirect_to chatrooms_path
  end
end
