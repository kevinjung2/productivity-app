class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :host_id
      t.string :name
      t.datetime :time 
      t.timestamps
    end
  end
end
