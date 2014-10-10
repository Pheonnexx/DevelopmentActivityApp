class CreateUsersLinemanagers < ActiveRecord::Migration
  def change
    create_table :users_linemanagers do |t|
      t.belongs_to :user
      t.belongs_to :linemanager

      t.timestamps
    end
  end
end
