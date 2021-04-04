class Category < ApplicationRecord
  has_many :items
  has_many :amounts, through: :items

  CATEGORY_NAMES = ["Undefined", "Food", "Decorations", "Serviceware", "Games", "Furniture", "Clothing"]

  def self.create_categories
    CATEGORY_NAMES.each do |name|
      Category.find_or_create_by(name: name)
    end
  end
end
