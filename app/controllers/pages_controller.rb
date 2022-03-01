class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @my_gyms = policy_scope(Gym).where(user: @user)
    @my_friendships = policy_scope(Friendship).where(user: @user)
  end
end
