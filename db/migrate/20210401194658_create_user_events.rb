class CreateUserEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :user_events do |t|

      t.timestamps
    end
  end
end
