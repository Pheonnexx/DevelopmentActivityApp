class CreateLinemanagers < ActiveRecord::Migration
  def change
    create_table :linemanagers do |t|
      t.integer :line_manager_id
      t.integer :user_id

      t.timestamps
    end
  end
end
