class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.belongs_to :skill_group
      t.string :skill_name, null: false
      t.string :skill_code
      t.string :skill_type

      t.references :skill_group, index: true
      t.timestamps
    end
  end
end
