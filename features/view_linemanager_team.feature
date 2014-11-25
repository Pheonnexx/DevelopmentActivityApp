@US017

Feature: View my team skills as a line manager

	As a Line manager
	I want to view my teams skills
	So that I can make resource decisions

	Acceptance Criteria:
	 - I should be able to view my teams individuals profiles
	 - I should be able to search for a team member

	Scenario: View My Team


	Scenario: View my linemanagement team
		Given that I am logged in as a Line manager
		And I linemanage "Leonard", "Sheldon" and "Penny"
		And that I have selected to view my team
		Then I can see all three people that I linemanage

@manual
	Scenario: View a team members profile
		Given that I am logged in as a Line manager
		And I amd the linemanager of "Howard"
		When I select to view his profile from the team list
		Then his profile is displayed

