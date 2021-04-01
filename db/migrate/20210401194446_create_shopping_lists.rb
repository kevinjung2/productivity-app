class CreateShoppingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists do |t|
      t.integer :event_id
      t.timestamps
    end
  end
end
