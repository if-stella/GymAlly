class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    redirect_to users_path if user_signed_in?
  end

  def dashboard
    @my_friendships = Friendship.where("user_one_id = ? or user_two_id = ?", current_user.id, current_user.id)
    @my_gyms = current_user.gym
    @user = current_user
  end
end
