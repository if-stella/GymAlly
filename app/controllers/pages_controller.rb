class PagesController < ApplicationController
  def home
    # redirect_to dashboard_path
  end

  def dashboard
    @my_friendships = Friendship.where("user_one_id = ? or user_two_id = ?", current_user.id, current_user.id)
    @my_gyms = current_user.gym
    @user = current_user
  end
end
