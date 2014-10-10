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

	def update
	    @user = User.find(current_user.id)

	    successfully_updated = if needs_password?(@user, params)
	      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
	    else
	      # remove the virtual current_password attribute
	      # update_without_password doesn't know how to ignore it
	      params[:user].delete(:current_password)
	      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
	    end

	    if successfully_updated
	      set_flash_message :notice, :updated
	      # Sign in the user bypassing validation in case their password changed
	      sign_in @user, :bypass => true
	      redirect_to after_update_path_for(@user)
	    else
	      render "edit"
	    end
	end


	private

	  # check if we need password to update user data
	  # ie if password or email was changed
	  # extend this as needed
	  	def needs_password?(user, params)
	    user.email != params[:user][:email] ||
	      params[:user][:password].present? ||
	      params[:user][:password_confirmation].present?
	  	end	



end