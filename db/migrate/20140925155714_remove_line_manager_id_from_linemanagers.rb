class RemoveLineManagerIdFromLinemanagers < ActiveRecord::Migration
  def change
    remove_column :linemanagers, :line_manager_id, :integer
  end
end
