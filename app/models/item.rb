class Item < ApplicationRecord
  has_many :amounts
  has_many :shopping_lists, through: :amounts
  belongs_to :category
end
