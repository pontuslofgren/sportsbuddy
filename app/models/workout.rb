class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :category
  belongs_to :location

  has_many :bookings
end
