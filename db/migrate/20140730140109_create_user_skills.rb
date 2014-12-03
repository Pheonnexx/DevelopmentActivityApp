class CreateUserSkills < ActiveRecord::Migration
  def change
    create_join_table :users, :skills, table_name: :user_skills do |t|

      t.index :user_id
      t.index :skill_id

      t.string :skill_level, :null => false
      t.string :date_last_used

      t.timestamps
    end
  end
end
