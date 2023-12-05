class Booking < ApplicationRecord
  belongs_to :workout
  belongs_to :user

  validates :attendees, presence: true
  validates :attendees, numericality: { greater_than: 0 }
  validate :max_number_of_attendees

  private

  def max_number_of_attendees
    # the number of attendees is not allowed to exceed the number of available spots
    if (self.workout.spots - self.workout.bookings.count) < self.attendees
      errors.add(:attendees, "cannot exceed number of available spots")
    end
  end
end
