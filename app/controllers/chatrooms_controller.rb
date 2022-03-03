class ChatroomsController < ApplicationController
  def index
    # only show chatrooms of current user
    @chatrooms = []
    Chatroom.all.each do |c|
      c.friendship.user_one == current_user || c.friendship.user_two == current_user ? @chatrooms << c : @chatrooms
    end
    @invitations = Friendship.where(user_two: current_user).where(status: "pending")
    @requests = Friendship.where(user_one: current_user).where(status: "pending")
    @friendships = Friendship.where("user_one_id = #{current_user.id} or user_two_id = #{current_user.id}").where(status: "accepted")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create(friendship_id: params[:id])
    redirect_to chatroom_path(@chatroom)
  end
end
