@US008 

Feature: Select a skill and skill rating

	As a User 
	I want to be able to select a skill and my skill level 
	So that i can list my skills and their levels

	Acceptance Criteria: 
	Skills must have:
		- Skill Name
		- Skill Code
		- Skill Type
	When selecting a skill a user must be able to set their skill level

	Scenario: I can select to add a skill to my profile
		Given that I am logged in 
		Then I am given the option to select a skill to add to my profile

	Scenario: I can add a skill to my profile
		Given that I am logged in 
		And I have selected to add a skill
		When I select 'MS Word' for the skill
		And I select the skill level of '2'
		When I select to save 
		Then I am returned to my profile with a successful save message

	Scenario: I can view the skills I have added via my profile
		Given that I am logged in 
		And I have added a skill called 'MS Word' with a skill level of '4'
		When I view my profile 
		And select to view my skills
		Then I can see that I have the skill 'MS Word' with the skill level of '4'

