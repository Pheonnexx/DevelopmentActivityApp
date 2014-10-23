class RemoveFieldsFromDevActivites < ActiveRecord::Migration
  def change
    remove_column :dev_activities, :notes, :text
  end
end
