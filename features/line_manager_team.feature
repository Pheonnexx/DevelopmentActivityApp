@US016

Feature: Set that someone is line manager by user
  
 	As a Linemanager 
 	I want to select people and make them part of my team
 	So that I can monitor their training and skills

 	Scenario: Select a person to add to my team
 		Given that I am logged in as a Line Manager
 		And I want to add "Betty" "Crocker" to my team
 		When I navigate to add someone to my team
 		And I search for "Betty" "Crocker"
 		And I select to add them
 		Then they are added to the team I line manage
