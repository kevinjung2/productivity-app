class AddFboauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :integer
    add_column :users, :email, :string
    add_column :users, :image, :string
  end
end
