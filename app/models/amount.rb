class Amount < ApplicationRecord
  belongs_to :item
  belongs_to :shopping_list

  def item_name
    self.item.name if self.item
  end
end
