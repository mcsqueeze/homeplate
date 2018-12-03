class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usertype, :string
    add_column :users, :username, :string
    add_column :users, :photo, :string
    add_column :users, :description, :text
    add_column :users, :phonenumber, :string
    add_column :users, :address, :string
    add_column :users, :verified, :boolean
  end
end
