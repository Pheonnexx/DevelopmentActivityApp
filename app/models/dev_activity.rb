class DevActivity < ActiveRecord::Base
	belongs_to :user

	validates :dev_type,  :presence => true

	DEVELOPMENT_TYPE = ["Book", "Mentoring", "Online Tutorial", "Booked Course"]

end
