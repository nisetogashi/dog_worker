class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|

      t.timestamps
      t.integer :pets_id
      t.integer :sitter_id
      t.integer :user_id
      t.string :time
      t.string :day
      t.string :total_payment
      t.text :introduction
      t.boolean :is_status, default: true
    end
  end
end
