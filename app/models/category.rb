class Category < ApplicationRecord
  has_many :items
  has_many :amounts, through: :items
end
