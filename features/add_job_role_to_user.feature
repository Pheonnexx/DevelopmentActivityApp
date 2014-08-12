@US009

Feature: Allow a user to choose a job role 
 		As a User 
 		I want to set my Job Role 
 		so that I can see associated skills that i could train in according to the role


 	Scenario: Selecting a job role when signing up for the first time
 		Given that I have chosen to sign up
 		And I have entered all the needed details
 		When I select the job role of "Tester"
 		And select to sign up
 		Then the job role is saved correctly as "Tester" on my profile

 	Scenario: Changing my job role when editing my profile
 		Given that "Jamie" is logged in
 		And has chosen to amend his profile
 		When he choses the new job role of "Kingslayer"
 		And saves his changes
 		Then "Kingslayer" is saved correctly in his profile