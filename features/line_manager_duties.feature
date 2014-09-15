@US015

Feature: Select who you line manage

	As a User 
	I want to set that I am a line manager 
	So that I can then manage my team

	Scenario: Set that I am a Line Manager 
		Given that I am logged in 
		When I choose to edit my profile
		And select that I have Line Manager duties
		When I have saved my changes
		Then I am given access to the Management Dashboard 

	Scenario: Sign up as a Line Manager
		Given that I have chosen to sign up
		When I enter my details correctly 
		And select that I have Line Manager duties
		When I select to sign up
		Then I am given access to the Management Dashboard