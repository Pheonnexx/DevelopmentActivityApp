class AddLastUserDateToUserSkills < ActiveRecord::Migration

  def change
  	add_column :user_skills, :date_last_used, :string
  end

end
