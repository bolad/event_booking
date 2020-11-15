class AddStartDateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_date, :string
  end
end
