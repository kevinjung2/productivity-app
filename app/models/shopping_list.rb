class ShoppingList < ApplicationRecord
  belongs_to :event
  has_many :amounts
  has_many :items, through: :amounts
end
