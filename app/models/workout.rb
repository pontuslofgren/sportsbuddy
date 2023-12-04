class Workout < ApplicationRecord
  include PgSearch::Model

  # Associations
  belongs_to :user
  belongs_to :level
  belongs_to :category
  belongs_to :location
  has_many :bookings, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Validations
  validates :address, presence: true

  # Search
  pg_search_scope :text_search,
                  against: %i[title description],
                  associated_against: {
                    user: %i[first_name last_name],
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
