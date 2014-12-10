class Skill < ActiveRecord::Base

		belongs_to :skill_group
		has_many :user_skills
  	has_many :users, :through => :user_skills

end
