class AddColomnNameToShoppingLists < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_lists, :name, :string
  end
end
