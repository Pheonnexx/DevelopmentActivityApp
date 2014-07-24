@US006

Feature:	Key Learning Points for Development Activities

			As a user 
			I want to record key learning points of the development activity I have completed 
			So that I can use this for discussion at a later date

			Acceptance Criteria:
			 - User is able to add key learning points when they add a development activity

	Scenario: When I am creating a development activity I can add key learning points and save 
		Given that I have logged in as "Thor"
		When I add a development activity	
		And I enter "Mjolnir can only be lifted by being deemed worthy"
		When I select to save the development activity
		Then the key learning point is displayed as part of the development activity

	Scenario: When I am creating a development activity and I dont add a key learning point I can save
		Given that I have logged in as "Loki"
		When I add a development activity without a key learning point
		When I select to save the development activity
		Then the development activity is displayed without a key learning point