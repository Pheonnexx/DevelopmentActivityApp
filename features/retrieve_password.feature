@US005

Feature: 	As a user
			I want to to be able to retrieve my password
			So that I can access the system again if I forget it.


	Scenario: There is an option to retrieve my password on the login page
		Given that I have an account for the development activity app
		When I select to "Login"
		Then I am provided the option to retrieve my password 

	Scenario: There is an option to retrieve my password on the sign up page
		Given that I have an account for the development activity app
		When I select to "Signup"
		Then I am provided the option to retrieve my password 

	@email
	Scenario:  When I select to retrieve my password it sends an email out to the address of my profile
		Given that I have an account with the email "heather.poole@landregistry.gsi.gov.uk"
		When I select the option to retrieve my password
		And enter my email
		When I select to retrieve my password
		Then a password retrieval email is sent 

	@email
	Scenario: Once a password retrieval email has been sent I can use its contents to reset my password
		Given that I have an account with the email "pheonn@hotmail.co.uk"
		And I have selected the option to retrieve my password
		When I enter the new password of "bananas2" and confirm it
		And I select to submit my new password
		Then I am signed in successfully with the new password