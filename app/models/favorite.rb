class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :sitter, class_name: 'Customer'
end
