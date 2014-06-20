Feature:  Sign up to the Development Activity App

	I want to sign up to the app
	So that I can log in and record activities under my profile


	Acceptance Criteria 
		These details are needed to identify the user
		 - First and Second Name
		 - email address
		 - work group 
		The same email address cannot be used more than once


	Scenario: When I visit the mainpage it gives me the option to sign up
		When I visit the mainpage
		Then I should see an option to sign up
		When I select to sign up
		Then I am directed to a sign up form

	Scenario: When the required information has been provided sign up is successful
		When I select to sign up
		And I enter the correct required information
		And choose to submit the information
		Then I am signed up successfully 