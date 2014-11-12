@US019

Feature: Set when a skill was last used
	As a User 
	I want to say when I last used a skill 
	So that I show how relevant it still is.

	Acceptance Criteria:
	The four categories for 'Skill last used'
	 - 0 - 6 Months
	 - 6 - 12 Months
	 - Over 1 Year
	 - Over 2 Years

Background: 
	Given that I have logged in


	Scenario: Add a new skill with the last used date of 0 - 6 months
		Given that I have chosen to add a new skill
		And I have select the skill last used date of "0 - 6 Months"
		And I have entered all required information
		When I select to save the skill
		Then it is displayed with the skill last used date of "0 - 6 Months"

	Scenario: Edit a skill with a different last used date
		Given that I have chosen to edit my skill of "Testing"
		And I have selected the skill last used date of "Over 2 Years"
		When I select to save the skill
		Then it is displayed with the skill last used date of "Over 2 Years"
