@US014 

Feature: Delete Users

	As an Admin 
	I want to be able to delete a user 
	So that I can keep the system up to date

	Acceptance Criteria:
	 - The admin must be warned before deleting a user

Background:
	Given that I am logged in as an admin
	And I am currently on the admin dashboard

@manual
	Scenario: Confirm and Delete a User
		Given that I select to manage users
		And it displays a list of users
		When I select to delete a user
		And I confirm that I want to delete them
		Then the user is no longer displayed

