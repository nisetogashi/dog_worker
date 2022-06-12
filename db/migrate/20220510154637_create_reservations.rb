class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date "day", null: false
      t.string "time", null: false
      t.integer "customer_id", null: false
      t.integer "sitter_id", null: false
      t.integer "pet_id"
      t.text "introduction"
      t.boolean "is_status", null: false, default: true
      t.boolean "is_completed", null: false, default: false
      t.datetime "start_time", null:false

      t.timestamps
    end
  end
end
