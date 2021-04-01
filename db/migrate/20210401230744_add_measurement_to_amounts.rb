class AddMeasurementToAmounts < ActiveRecord::Migration[6.1]
  def change
    add_column :amounts, :measurement, :string
  end
end
