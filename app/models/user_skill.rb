class UserSkill < ActiveRecord::Base
	belongs_to :skill 
	belongs_to :user

	SKILL_LEVEL = ['None', 'Basic', 'Proficient', 'Expert']

	SKILL_AGE = ['0 - 6 Months', '6 - 12 Months', 'Over 1 Year', 'Over 2 Years']
	
end
