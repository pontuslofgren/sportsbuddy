module ApplicationHelper
  def format_date_time(date)
    date.strftime('%a %d of %b at %H:%M')
  end

  def user_signed_up_to_workout?(workout)
    # user is creator of workout
    if user_owns_workout?(workout)
      return true
    elsif user_has_booked_workout?(workout)
      return true
    else
      return false
    end
  end

  def user_owns_workout?(workout)
    workout.user == current_user
  end

  def user_has_booked_workout?(workout)
    if workout.bookings.any?
      workout.bookings.each do |booking|
        return true if booking.user == current_user
      end
      return false
    end
  end
end
