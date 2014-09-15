class Addlinemanagertouser < ActiveRecord::Migration
  def change
  	add_column :users, :line_manager, :boolean
  end
end
