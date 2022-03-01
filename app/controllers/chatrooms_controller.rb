class ChatroomsController < ApplicationController
  def index
    # only show chatrooms of current user
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
