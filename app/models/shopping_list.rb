class ShoppingList < ApplicationRecord
  belongs_to :event
  has_many :amounts
  has_many :items, through: :amounts

  # accepts_nested_attributes_for :amounts, reject_if: :blank_amount?

  def amounts_attributes=(attributes)
    attributes.values.each do |value|
      if value[:measurement] != "" && value[:item] != ""
        Amount.create(shopping_list: self, measurement: value[:measurement], item: Item.find_or_create_by(name: value[:item_name], description: "pending", category: Category.find_or_create_by(name: "Undefined")))
      end
    end
  end

  # def blank_amount?(attributes)
  #   attributes[:measurement].blank? || attributes[:item].blank?
  # end
end
