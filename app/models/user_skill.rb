class UserSkill < ActiveRecord::Base
	belongs_to :skill 
	belongs_to :user

	SKILL_LEVEL = ['1', '2', '3', '4', '5', '6']
	
end
