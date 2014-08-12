class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|

      t.belongs_to :skill
      t.belongs_to :user

      t.integer :skill_id, :null => false
      t.integer :user_id, :null => false

      t.string :skill_level, :null => false

      t.timestamps
    end
  end
end
