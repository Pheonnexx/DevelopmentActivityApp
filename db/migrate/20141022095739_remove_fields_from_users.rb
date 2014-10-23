class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :workgroup, :string
    remove_column :users, :job_grade, :string
    remove_column :users, :location, :string
    remove_column :users, :team, :string
  end
end
