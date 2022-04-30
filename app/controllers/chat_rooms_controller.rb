class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRooms.all
  end

  def show
    chat_room = ChatRoom.find(params[:id])
    @messages = chat_room.messages
  end

  def create
    # if ChatRoom.between(params[:user_id], params[:sitter_id]).present?
    #   @chat_room = ChatRoom.between(params[:user_id], params[:sitter_id]).first
    # else
    #   @chat_room = ChatRoom.create!(chat_room_params)
    # end
    @chat_room = ChatRoom.find_or_create_by(chat_room_params)
     #chat_roomがない場合はcreateする。ある場合はfind_byする（探してくる）
    redirect_to chat_room_path(@chat_room)
  end

  private

  def chat_room_params
    params.permit(:user_id, :sitter_id)
  end
end

