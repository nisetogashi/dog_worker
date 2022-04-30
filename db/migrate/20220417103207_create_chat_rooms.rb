class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|

      t.timestamps
      t.integer :sitter_id
      t.integer :user_id
      t.text :introduction
    end
  end
end
