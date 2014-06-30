class AddWorkGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :workgroup, :string, null: false

  end
end
