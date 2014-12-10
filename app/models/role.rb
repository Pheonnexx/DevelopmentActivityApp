class Role < ActiveRecord::Base
	has_one :user
	has_many :role_skills, dependent: :destroy
	has_many :skill_groups, :through => :role_skills

	accepts_nested_attributes_for :role_skills,
			:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }, :allow_destroy => true
end
