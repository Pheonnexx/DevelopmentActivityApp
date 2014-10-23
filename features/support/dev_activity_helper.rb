module DevActivityHelper

	def create_dev_activity
		page.click_link('My Profile')
		page.click_link("My Development Activities")
		page.click_link('Add Development Activity')
		page.select "Book", :from => "Development Type"
		page.fill_in "Development Subject", :with => "Subject"
		page.check "Was this Self Directed Learning?"
		page.fill_in "Date Completed", :with => "02/02/2014"
		page.fill_in "Time Taken", :with => "3"
		page.fill_in "Key Learning Points", :with => "Activity Notes"
	end

end

World(DevActivityHelper)