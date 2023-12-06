class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def sender?(user)
    self.user == user
  end
end
