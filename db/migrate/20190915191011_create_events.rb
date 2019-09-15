class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :price
      t.datetime :start_at
      t.integer :alloted_tickets
      t.integer :sold_out_tickets

      t.timestamps
    end
  end
end
