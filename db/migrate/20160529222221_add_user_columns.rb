class AddUserColumns < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :password, :string
  	add_column :users, :password_digest, :string
  	add_column :users, :email, :string
  	
  end
end
