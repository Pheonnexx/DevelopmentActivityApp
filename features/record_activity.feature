@US003
Feature:  	Record Development Activity

			As a User
			I want to record my development activity 
			so that I can look at what I have done

	Acceptance Criteria:
		It needs to contain the following information on a development activity:
		 - Date Completed
		 - Time Taken (HRS)
		 - Development Subject
		 - Development Type
		 - Key Learning Points
		 - Was this self directed learning? (y/n)

	Scenario: When I am logged into the system I am given the option to record a development activity
		Given that "Betty" is logged in
		Then she can choose the option to record a development activity
		When she selects to record an activity 
		Then she is directed to record development activity section

	Scenario: I can record a development activity
		Given that "Arya" has chosen to record an activity
		And she records "Book" as a development type
		And she records "For Dummies: Dire Wolves" for the development subject
		And she records she completed the activity on the "03/11/2013"
		And she records "3" hours as the time it took her
		And she records in Key Learning Points that it was "Interesting"
		And she records that it was self directed learning
		When she submits this
		Then it is saved
		And the activity is displayed to her
