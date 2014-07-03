@US003
Feature:  	I want to record my development activity 
			so that I look at what I have done

	Acceptance Criteria:
		It needs to contain the following information on a development activity:
		 - Development Type (book?Course)
		 - When it was done
		 - How long it took
		 - notes

	Scenario: When I am logged into the system I am given the option to record a development activity
		Given that "Betty" is logged in
		Then she can choose the option to record a development activity
		When she selects to record an activity 
		Then she is directed to record development activity section

	Scenario: I can record a development activity
		Given that "Arya" has chosen to record an activity
		And she records "Book" as a development type
		And she records she completed the activity on the "03/11/2013"
		And she records "3" hours as the time it took her
		And she records in notes that it was "For Dummies: Dire Wolves"
		When she submits this
		Then it is saved
		And the activity is displayed to her
