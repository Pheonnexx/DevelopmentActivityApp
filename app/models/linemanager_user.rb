class LinemanagerUser < ActiveRecord::Base
	belongs_to :linemanager
	belongs_to :user
end
