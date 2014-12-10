@US014

Feature: Delete Users

	As an Admin
	I want to be able to delete a user
	So that I can keep the system up to date

	Acceptance Criteria:
	 - The admin must be warned before deleting a user
	 - Cannot delete yourself

Background:
	Given that I am logged in as an admin
	And I am currently on the admin dashboard

@javascript
	Scenario: Confirm and Delete a User
		Given that I select to manage users
		And I search for the user 'Rose'
		When I select to delete a user
		And I confirm that I want to delete them
		Then the user is no longer displayed

@javascript
	Scenario: Cannot delete yourself
		Given that I select to manage users
		And I search for myself
		Then there should be no delete option for myself
