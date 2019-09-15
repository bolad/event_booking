class AddIndexToBookings < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, :event_id
    add_index :bookings, :user_id
  end
end
