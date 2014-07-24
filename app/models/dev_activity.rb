class DevActivity < ActiveRecord::Base
	#Dev Activities belong to user, an activity can belong to one user but a user can have many dev activities
	belongs_to :user

	#This makes sure that when someone tries to save a dev activity that they have selected a dev type
	validates :dev_type,  :presence => true

	#This is the different development types that can be selected when recording a dev activity
	DEVELOPMENT_TYPE = ["Book", "Mentoring", "Online Tutorial", "Booked Course"]

end
