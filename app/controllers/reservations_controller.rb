class ReservationsController < ApplicationController
  before_action :authenticate_customer!

  def list
    @customer_reservations = current_customer.reservations.where("day >= ?", Date.current).order(day: :desc)
    @visit_historys = current_customer.reservations.where("day < ?", Date.current).where("day > ?", Date.today << 12).order(day: :desc)
  end

  def index
    @sitter = Customer.find(params[:sitter_id])
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    message = Reservation.check_reservation_day(@day.to_date)
    if !!message #trueとfalseで変換する
      redirect_to  customer_sitter_reservations_path(params[:customer_id], params[:sitter_id]), flash: { alert: message }
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @customer_reservations = current_customer.reservations.where("day >= ?", Date.current).order(day: :desc)
    @visit_historys = current_customer.reservations.where("day < ?", Date.current).where("day > ?", Date.today << 12).order(day: :desc)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to customer_sitter_reservation_path(params[:customer_id], params[:sitter_id], @reservation)
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to custoemer_path(current_customer.id), flash: { success: "予約を削除しました" }
    else
      render :show, flash: { error: "予約の削除に失敗しました" }
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :time, :customer_id, :start_time)
  end
end
