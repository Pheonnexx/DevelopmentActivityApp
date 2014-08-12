#This is a temporary migration for the database
class AddPasswordTemptoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password_temp, :string
  end
end
