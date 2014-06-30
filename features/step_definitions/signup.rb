When(/^I visit the mainpage$/) do
  visit_mainpage
end

Then(/^I should see an option to sign up$/) do
  assert page.has_link?('Signup')
end

When(/^I select to sign up$/) do
  visit_mainpage
  page.click_link('Signup')
end

Then(/^I am directed to a sign up form$/) do
	assert page.has_content?('Signup')
end

When(/^I enter the correct required information$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Work Group", :with => "Testing"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

When(/^choose to submit the information$/) do
  click_signup
end

Then(/^I am signed up successfully$/) do
  assert page.has_text?('Welcome! You have signed up successfully.')
end

When(/^I enter all information but the first name$/) do
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Work Group", :with => "Testing"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

When(/^I choose to submit the information$/) do
  click_signup
end

Then(/^I am prevented from signing up and a message tells me that my first name is missing$/) do
  assert page.has_text?("First name can't be blank")
end

When(/^I enter all information but the surname$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Work Group", :with => "Testing"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Then(/^I am prevented from signing up and a message tells me that my surname is missing$/) do
  assert page.has_text?("Surname can't be blank")
end

When(/^I enter all information but the emal$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Work Group", :with => "Testing"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Then(/^I am prevented from signing up and a message tells me that my email is missing$/) do
  assert page.has_text?("Email can't be blank")
end

When(/^I enter all information but the work group$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Then(/^I am prevented from signing up and a message tells me that my work group is missing$/) do
  assert page.has_text?("Workgroup can't be blank")
end