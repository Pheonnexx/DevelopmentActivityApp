@US011

Feature: Allow an Admin to add a job group

	As an Admin
	I want to be able to add new roles
	so that they can update the roles to follow the evolution of the Land Registry

	Acceptance Criteria:
	Items to be included in a job role:
	 - Role Group Name
	 - Role Group Description

	Scenario: Add a new role group
		Given that I am logged in as an admin
		And I select to add a new role
		When I enter the role group name and description
		And I select to create the role
		Then it is saved correctly

	
