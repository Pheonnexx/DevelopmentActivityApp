@US012

Feature: Add skills to a job role

	As an Admin
	I want to associate skill groups to role groups
	So when users view them they can see what skill groups are linked with role groups

	Acceptance Criteria:
	 - I want to be able to add single or multiple skill groups on role group creation
	 - I want to able to edit an already created role to add skills

Background:
	Given that I am logged in as an admin
	And there are three skill groups held in the app for "Testing", "Communication" and "Development"

	Scenario: When creating a role I can add one skill
		Given that I have chosen to create a job group
		When I have entered the role group details
		And I select the the skill group "Testing"
		When I select to create the new role group
		Then it is successfully saved alongside the associated skill groups

@manual
	Scenario: When creating a role group I can add three skill groups
		Given that I have chosen to create a job group
		When I have entered the role details
		And I select the the skill groups "Communication", "Testing" and "Development"
		When I select to create the new role group
		Then it is successfully saved alongside the three associated skill groups

@manual
	Scenario: When editing a role I can add a skill
		Given that I have chosen to edit a job group
		And I select the the skill "Development"
		When I select to update the job group
		Then it is successfully saved alongside the associated skill group
