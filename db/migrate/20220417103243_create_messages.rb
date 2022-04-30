class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.timestamps
      t.integer :chat_room_id
      t.integer :customer_id
      t.text :intrduction
    end
  end
end
