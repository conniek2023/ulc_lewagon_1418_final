class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name ,:string
    add_column :users, :last_name ,:string
    add_column :users, :location ,:string
    add_column :users, :nationality ,:string
    add_column :users,  :preferred_name ,:string
    add_column :users,  :gender,:string
  end
end
