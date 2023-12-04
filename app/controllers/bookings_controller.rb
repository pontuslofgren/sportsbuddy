class BookingsController < ApplicationController

  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(bookings_params)
    @workout = Workout.find(params[:id])
    @booking.workout_id = @workout.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to profile_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to profile_path(current_user.id), notice: 'Booking canceled succesfully'
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:comment, :attendees)
  end

end
