class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @workout = Workout.find(params[:id])
    @booking.workout_id = @workout.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to profile_path(current_user)
    else
      raise
      render 'workouts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:comment, :attendees)
  end

end
