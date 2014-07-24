@US004

Feature:	View own profile

			As a User
			I want to view my own profile 
			So that I can see my own details

			Acceptance Criteria:
			 - View all account details that are used in sign up (except password)
			 - View their recorded activities

	Scenario: When I login I am given the option to view my profile
		Given that "Sansa" is logged in 
		Then there will be an option to view her profile

	Scenario: When I choose to view my profile I am displayed my account details
		Given that Heather Poole has logged in
		And has chosen to view her profile
		Then her account details are displayed correctly

	Scenario: When I view my profile I can view all my development activities
		Given that "Ned" is logged in
		And has created a dev activity for reading the "book" called "famous beheadings"
		When he views his profile
		Then he sees the dev activity for the book 
