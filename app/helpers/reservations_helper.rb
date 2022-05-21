module ReservationsHelper
  def times
    times = ["00:00",
             "01:00",
             "02:00",
             "03:00",
             "04:00",
             "05:00",
             "06:00",
             "07:00",
             "08:00",
             "09:00",
             "10:30",
             "11:00",
             "12:00",
             "13:00",
             "14:00",
             "15:00",
             "16:00",
             "17:00",
             "18:00",
             "19:00",
             "20:00",
             "21:00",
             "22:00",
             "23:00"]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end
end
