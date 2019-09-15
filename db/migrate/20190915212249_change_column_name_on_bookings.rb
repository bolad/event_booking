class ChangeColumnNameOnBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :ticket, :tickets
  end
end
