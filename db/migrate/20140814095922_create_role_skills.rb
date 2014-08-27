class CreateRoleSkills < ActiveRecord::Migration
  def change
    create_table :role_skills do |t|

      t.belongs_to :skill
      t.belongs_to :role

      t.integer :skill_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
