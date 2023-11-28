class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :level
  belongs_to :category
  belongs_to :location

  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true

end
