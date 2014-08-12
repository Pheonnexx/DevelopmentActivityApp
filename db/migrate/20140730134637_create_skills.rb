class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name, null: false
      t.string :skill_code
      t.string :skill_type

      t.timestamps
    end
  end
end
