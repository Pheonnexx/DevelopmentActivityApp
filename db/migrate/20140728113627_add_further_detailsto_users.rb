class AddFurtherDetailstoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :job_grade, :string, :default => nil, null: true	
  	add_column :users, :location, :string, :default => nil, null: true	
  	add_column :users, :team, :string, :default => nil, null: true
  end
end
