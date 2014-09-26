class CreateLinemanagerUsers < ActiveRecord::Migration
  def change
    create_table :linemanager_users do |t|

      t.timestamps
    end
  end
end
