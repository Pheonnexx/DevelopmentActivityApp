@US019

Feature: View a user's profile

	As an Admin
	I want to view a user's profile 
	So that I can confirm who they are


	Scenario: Select to view a user's profile
		Given that I am logged in as an admin
		When I select to manage users and search for "Barbara" "Gordon"
		And select to view their profile
		Then I am displayed the profile of "Barbara" "Gordon"