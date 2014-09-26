class Linemanager < ActiveRecord::Base
	has_many :users, :through => :linemanager_user
end
