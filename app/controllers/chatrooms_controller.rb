class ChatroomsController < ApplicationController

  def show
    chatroom = Chatroom.find(params[:id])
    # user must be workout owner or have a booked spot to enter the chatroom
    if helpers.user_signed_up_to_workout?(chatroom.workout)
      @chatroom = chatroom
      @message = Message.new
    end
  end
end
