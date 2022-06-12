class MyReservationsController < ApplicationController
  def index
    @my_reservations = Reservation.where(sitter_id: current_customer.id)
  end

  def update
    my_reservation = Reservation.find(params[:id])

    if my_reservation.is_completed == true
      my_reservation.update(is_completed: false)
    else
      my_reservation.update(is_completed: true)
    end

    redirect_to my_reservations_path
  end
end
