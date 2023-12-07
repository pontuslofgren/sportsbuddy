class ChatroomsController < ApplicationController
  def show
    chatroom = Chatroom.find(params[:id])
    # user must be workout owner or have a booked spot to enter the chatroom
    @chatroom = chatroom
    @message = Message.new
    # list all workouts and bookings, get the chatrooms
  end
end
