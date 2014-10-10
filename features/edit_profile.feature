@US013

Feature: Edit your own profile
	
		As a User 
		I want to be able to edit my profile 
		so that I can keep it up to date

		Acceptance Criteria: 
		 - Do not allow the email address to be edited.

	Scenario: Amend my profile by changing surname
		Given that I am logged in as "Caitlyn" "Tully"
		When I choose to edit my profile
		And amend the surname to "Stark"
		When I select to update my profile
		Then my surname is displayed correctly on my profile as "Stark"

	Scenario: Attempt to change my email address
		Given that I am logged in
		When I choose to edit my profile
		Then I am not supplied an option to change my email address




