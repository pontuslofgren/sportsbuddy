module ApplicationHelper
  def format_date_time(date)
    date.strftime('%a %d of %b at %H:%M')
  end

  def user_signed_up_to_workout?(workout)
    # user is creator of workout
    if workout.user == current_user
      return true
    elsif workout.bookings.any?
      workout.bookings.each { |booking| booking.user == current_user }
      return true
    else
      return false
    end
  end
end
