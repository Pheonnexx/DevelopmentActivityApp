@US012 

Feature: Add skills to a job role

	As an Admin 
	I want to associate skills to roles
	So when users view them they can see what skills are linked with roles

	Acceptance Criteria:
	 - I want to be able to add single or multiple skills on a role creation
	 - I want to able to edit an already created role to add skills

Background:
	Given that I am logged in as an admin
	And there are three skills held in the app for "Testing", "Communication" and "Development"

	Scenario: When creating a role I can add one skill
		Given that I have chosen to create a job role
		When I have entered the role details
		And I select the the skill "Testing"
		When I select to create the new role 
		Then it is successfully saved alongside the role skill

@manual
	Scenario: When creating a role I can add three skills
		Given that I have chosen to create a job role
		When I have entered the role details
		And I select the the skills "Communication", "Testing" and "Development"
		When I select to create the new role 
		Then it is successfully saved alongside the three role skills

@manual
	Scenario: When editing a role I can add a skill
		Given that I have chosen to edit a job role 
		And I select the the skill "Development"
		When I select to update the job role 
		Then it is successfully saved alongside the role skill
