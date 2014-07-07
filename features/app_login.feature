@US002
Feature: 	Logging in

			I want to log in 
			so i can record development activites against myself

	Scenario: I am able to login from the mainpage
		Given that I have visited the mainpage
		Then I am given the opportunity to login

	Scenario: I can log into the dev activity app 
		Given that I select to log in
		When I enter a correct email and password
		And select to login with that information
		Then I log in successfully

	Scenario: When I log in successfully I am told I successfully logged in
		Given that "Penelope" "Pitstop" has entered the correct login information
		And selects to login
		Then she is informed that she has signed in correctly

	Scenario: If I am logged in I want to be able to logout
		Given that I am logged in
		Then I am given the opportunity to logout
		When I select to logout 
		Then I am returned to the mainpage
		