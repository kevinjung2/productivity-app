class ShoppingList < ApplicationRecord
  belongs_to :event
  has_many :amounts
  has_many :items, through: :amounts

  accepts_nested_attributes_for :amounts, reject_if: :blank_amount?

  def blank_amount?(attributes)
    attributes[:measurement].blank? || attributes[:item_id].blank?
  end
end
