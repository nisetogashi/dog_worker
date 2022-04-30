class Message < ApplicationRecord
  belongs_to :customer
  belongs_to :chat_room

  validates_presence_of :introduction, :chat_room_id, :user_id

  def message_time
    created_at.strftime("%m%d%y at %l:%M %p")
  end
end
