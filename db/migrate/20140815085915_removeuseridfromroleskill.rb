class Removeuseridfromroleskill < ActiveRecord::Migration
  def change
  	remove_column :role_skills, :user_id
  end
end
