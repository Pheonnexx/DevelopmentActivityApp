module DevActivityHelper

	def create_dev_activity
		page.click_link('New Dev Activity')
		page.select "Book", :from => "Development Type"
		page.fill_in "Date Completed", :with => "02/02/2014"
		page.fill_in "Time Taken", :with => "3"
		page.fill_in "Notes", :with => "Activity Notes"
	end

end

World(DevActivityHelper)