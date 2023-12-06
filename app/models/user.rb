class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :bookings
  has_many :workouts
  #has_many :workouts, through: :bookings

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def all_workouts
    all_workouts = workouts
    bookings.each { |booking| all_workouts << booking.workout}
    return all_workouts
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
