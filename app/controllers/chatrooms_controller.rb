class ChatroomsController < ApplicationController
  def index
    # only show chatrooms of current user
    @chatrooms = []
    # create an array of arrays (each contains the chatroom instance and the other user as instance):
    # [[chatroom, other_user], ...]
    Chatroom.all.each do |c|
      if c.friendship.user_one == current_user || c.friendship.user_two == current_user
        @chatrooms << [
          c,
          other_user(c.friendship),
          last_message(c)
        ]
      end
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

  private

  def other_user(friendship)
    if friendship.user_one == current_user
      friendship.user_two
    elsif friendship.user_two == current_user
      friendship.user_one
    else
      return nil
    end
  end

  def last_message(chatroom)
    Message.where(chatroom: chatroom).empty? ? "Start to chat" : Message.where(chatroom: chatroom).last.text
  end
end
