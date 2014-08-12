@US013

Feature: Edit your own profile
	
		As a User 
		I want to be able to edit my profile 
		so that I can keep it up to date

		Acceptance Criteria: 
		 - Do not allow the email address to be edited.
		 - The user has to enter their current password again to prevent fraudulent changes of profiles

	Scenario: Amend my profile by changing surname
		Given that I am logged in as "Caitlyn" "Tully"
		When I choose to edit my profile
		And amend the surname to "Stark"
		And I enter my current password
		When I select to update my profile
		Then my surname is displayed correctly on my profile as "Stark"

	Scenario: Attempt to change my email address
		Given that I am logged in
		When I choose to edit my profile
		Then I am not supplied an option to change my email address

	Scenario: Attempt to edit profile with incorrect password
		Given that I am logged in 
		And I have chosen to edit my profile
		When I have entered the needed profile changes
		And I enter the current password incorrectly
		When I select to update my profile 
		Then I am displayed an error message and prevented from doing so

	Scenario: Change Password correctly
		Given that I am logged in 
		And I have chosen to edit my profile
		When I enter a new password
		And I confirm my new password 
		And I enter my current password correctly
		When I select to update my profile
		Then informs me that my profile has been updated correctly

	Scenario: Attempt to change password with incorrect current password
		Given that I am logged in 
		And I have chosen to edit my profile
		When I enter a new password and confirm it
		Then enter my current password incorrectly 
		When I select to update my profile
		Then I am displayed an error concerning an incorrect password

	Scenario: Attempt to change password where one password entry is incorrect
		Given that I am logged in
		And I have chosen to edit my profile
		When I enter a new password I confirm it incorrectly
		Then I enter my current password correctly
		When I select to update my profile
		Then I am informed that one of my passwords are incorrect.

