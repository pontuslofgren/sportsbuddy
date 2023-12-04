class Chatroom < ApplicationRecord
  belongs_to :workout
  has_many :messages, dependent: :destroy
end
