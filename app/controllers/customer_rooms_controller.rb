class CustomerRoomsController < ApplicationController

  def show
    room = Room.create!
    customer_room = CustomerRoom.new(room: room.id, customer: current_customer)
    customer_room.save!
    customer_room = CustomerRoom.find(params[:id])
    @chats = customer_room.chats
  end

  # def create
  #   room = Room.create!
  #   customer_room = CustomerRoom.new(room: room.id, customer: current_customer)
  #   customer_room.save!
  #     redirect_to customer_room_path(customer_room)
  # end
end
