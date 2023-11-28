class Category < ApplicationRecord

  CATEGORIES = [
    'Running',
    'Strength',
    'Yoga',
    'Swimming',
    'Racket sport',
    'Cardio',
    'Bicycle',
    'Rowing',
    'Other'
  ]

  # Generate time intervals in minutes
  TIME_INTERVALS_MINUTES = (15..240).step(15).to_a

  # Convert each interval into "HH:MM" format
  TIME_INTERVALS_FORMATTED = TIME_INTERVALS_MINUTES.map do |minutes|
    hours = minutes / 60
    mins = minutes % 60
    format("%02d:%02d", hours, mins)
  end

end
