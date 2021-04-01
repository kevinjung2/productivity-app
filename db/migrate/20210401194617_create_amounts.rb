class CreateAmounts < ActiveRecord::Migration[6.1]
  def change
    create_table :amounts do |t|
      t.integer :item_id
      t.integer :shopping_list_id
      t.timestamps
    end
  end
end
