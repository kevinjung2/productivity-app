class ShoppingList < ApplicationRecord
  belongs_to :event
  has_many :amounts
  has_many :items, through: :amounts

  # accepts_nested_attributes_for :amounts, reject_if: :blank_amount?

  def amounts_attributes=(attributes)
    attributes.values.each do |value|
      item = Item.find_by(name: value[:item_name])
      if value[:measurement] != "" && value[:item_name] != ""
        if amount = Amount.find_by(id: value[:id])
          if item
            amount.update(measurement: value[:measurement], item: item)
          else
            amount.update(measurement: value[:measurement], item: Item.create(name: value[:item_name], description: "pending", category: Category.find_or_create_by(name: "Undefined")))
          end
        else
          if item
            Amount.create(shopping_list: self, measurement: value[:measurement], item: item)
          else
            Amount.create(shopping_list: self, measurement: value[:measurement], item: Item.create(name: value[:item_name], description: "pending", category: Category.find_or_create_by(name: "Undefined")))
          end
        end
      end
    end
  end

  # def blank_amount?(attributes)
  #   attributes[:measurement].blank? || attributes[:item].blank?
  # end
end
