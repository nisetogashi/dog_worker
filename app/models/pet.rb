class Pet < ApplicationRecord
  has_many_attached :images
  # has_many :sitter_pets, dependent: :destory
end
