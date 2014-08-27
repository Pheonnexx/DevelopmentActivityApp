class Skill < ActiveRecord::Base

	has_many :user_skills 
  	has_many :users, :through => :user_skills
  	has_many :roles
  	has_many :roles, :through => :role_skills

end
