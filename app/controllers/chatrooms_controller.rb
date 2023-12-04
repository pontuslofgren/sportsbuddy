class ChatroomsController < ApplicationController

  def show
    chatroom = Chatroom.find(params[:id])
    # user must be workout owner or have a booked spot to enter the chatroom
    if chatroom.workout.user == current_user || chatroom.workout.bookings.users.include? == current_user
      @chatroom = chatroom
      @message = Message.new
    end
  end
end
