class Reservation < ApplicationRecord
  belongs_to :customer
  has_many :reviews, dependent: :destroy

  validates :day, presence: true
  validates :time, presence: true
  validates :start_time, presence: true, uniqueness: true

  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end

  def date_before_start
    return if day < Date.current
    errors.add(:day, "は過去の日付は選択できません。予約画面から正しい日付を選択してください。")
  end

  def date_current_today
    errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  end

  def date_three_month_end
    errors.add(:day, "は3ヶ月以降の日付は選択できません。予約画面から正しい日付を選択してください。") if (Date.current >> 3) < day
  end

  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end

  def self.reservations_after_three_month
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end
end
