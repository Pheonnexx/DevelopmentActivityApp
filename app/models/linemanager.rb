class Linemanager < ActiveRecord::Base
	belongs_to :user
	has_many :users_linemanagers
	has_many :users, :through => :users_linemanagers

	accepts_nested_attributes_for :users_linemanagers,
			:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }, :allow_destroy => true



end
