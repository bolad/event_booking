class AddForeignKeyToBookings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookings, :events
    add_foreign_key :bookings, :users
  end
end
