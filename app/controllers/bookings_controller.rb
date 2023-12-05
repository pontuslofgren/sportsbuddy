class BookingsController < ApplicationController

  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(bookings_params)
    @workout = Workout.find(params[:id])
    @booking.amount = @workout.amount * @booking.attendees
    @booking.state = 'pending'
    @booking.workout_id = @workout.id
    @booking.user_id = current_user.id
    if @booking.save
      session = Stripe::Checkout::Session.create({
        line_items: [
          {
          price_data: {
            currency: 'eur',
            product_data: {
              name: @workout.title,
            },
            unit_amount: @workout.amount,
          },
          quantity: @booking.attendees,
        }
      ],
        mode: 'payment',
        # These placeholder URLs will be replaced in a following step.
        success_url: 'https://example.com/success',
        cancel_url: 'https://example.com/cancel',
      })
      session_id = session.id
      @booking.update(checkout_session_id: session_id) #this could be done using parameter from success page?
      redirect_to session.url, allow_other_host: true
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
