@US007

 Feature:  Change my password
 			As a User 
 			I want to be able to change my password 
 			so that I can keep my profile secure

 	Scenario: When viewing my profile I have the opportunity to change my password
 		Given that I am logged in as Betty
 		When I view my profile
 		Then I should be given the option to change my password

 	Scenario: When a new password is entered correctly I can change my password
 		Given that "Betty" has chosen to change their password
 		And they enter "suarezz1" as their new password
 		And enters "suarezz1" to confirm their password
 		And they enter their current password
 		When they select to save their new password
 		Then they are informed that it has been changed successfully

 	Scenario: When the new password confirmation is entered incorrectly I am stopped from saving my new password
 		Given that "Robert" has chosen to change their password
 		And they enter "Baratheon1" as their new password
 		And enters "Baratheon2" to confirm their password
 		And they enter their current password
 		When they select to save their new password
 		Then they are informed that the passwords haven't been saved as there is a mismatch