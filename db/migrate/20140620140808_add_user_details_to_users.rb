class AddUserDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :surname, :string, null: false
  end
end
