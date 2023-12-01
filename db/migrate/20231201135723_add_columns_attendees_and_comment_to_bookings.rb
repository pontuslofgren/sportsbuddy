class AddColumnsAttendeesAndCommentToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :attendees, :integer, default: 1
    add_column :bookings, :comment, :string
  end
end
