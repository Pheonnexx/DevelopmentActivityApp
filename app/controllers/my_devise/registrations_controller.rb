class MyDevise::RegistrationsController < Devise::RegistrationsController

	def create
		
		super #this calls Devise::RegistrationsController#create
		# whenever a new user is created with line_manager = true, create a new line_manager
		# and populate the linemanager.user_id with the same user_id that was just created.
		if resource.save and resource.line_manager == true
			@linemanager = Linemanager.new()
			@linemanager.user_id = resource.id 
			@linemanager.save
		end

	end

	def destroy

		super
		if resource.destroy and resource.line_manager == true
			@linemanager = Linemanager.find_all_by_user_id(resource.id)
			@linemanager = each do |linemanager|
				linemanager.destroy
			end
		end

	end

end