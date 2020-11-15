class AddStartTimeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_time, :string
  end
end
