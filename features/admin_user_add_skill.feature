@US010

Feature: Add Skill as Admin User

	As an Admin User
	I want to add new skills
	So that I can keep the skills list up to date for users to select from

	Acceptance Criteria:
	 - Only an admin user has access to this activity

	Scenario: When I log in as an admin I have access to Add a New Skill
		Given that I am logged in as an Admin User
		And I have gone to the admin dashboard
		Then I am given the option to Add a New Skill

	Scenario: When I add a skill it will display it to me
		Given that I am logged in as an Admin User
		And I have selected to create a new skill
		And I have entered the new skills details
		When I select to save it
		Then its displayed with the correct details
