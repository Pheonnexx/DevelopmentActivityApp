class LinemanagersUsers < ActiveRecord::Migration
  def change
    create_table :linemanagers_users do |t|
      t.belongs_to :linemanager
      t.belongs_to :user
    end
  end
end
