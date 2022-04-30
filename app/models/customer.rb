class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :images

  # has_many :sitter_pets, dependent: :destory
  # has_many :reviews, dependent: :destory
  # has_many :bookings, dependent: :destory
  # has_many :fovarites, dependent: :destory
  # has_many :receptions, dependent: :destory
  # has_many :chat_rooms, dependent: :destory
  has_many :messages, dependent: :destroy
end
