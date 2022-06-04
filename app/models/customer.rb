class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many_attached :images

  has_many :customer_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :sitters, through: :favorites, source: :sitter

  has_many :favorites, class_name: "Favorite", foreign_key: :sitter_id
  has_many :sitters, through: :favorites, source: :sitter

  def favorite?(customer) #customerはcurrent_customer
    favorites.where(customer_id: customer.id, sitter_id: self.id).exists? #selfは@sitter
  end

end
