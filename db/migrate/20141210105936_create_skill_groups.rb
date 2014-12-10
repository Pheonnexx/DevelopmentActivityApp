class CreateSkillGroups < ActiveRecord::Migration
  def change
    create_table :skill_groups do |t|

      t.timestamps
    end
  end
end
