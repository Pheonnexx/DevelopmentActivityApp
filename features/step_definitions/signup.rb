When(/^I visit the mainpage$/) do
  visit_mainpage
end

Then(/^I should see an option to sign up$/) do
  assert page.has_link?('Signup')
end

When(/^I select to sign up$/) do
  visit_mainpage
  @role = FactoryGirl.create(:role)
  page.click_link('Signup')
end

Then(/^I am directed to a sign up form$/) do
	assert page.has_content?('Signup')
end

When(/^I enter the correct required information$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
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
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Then(/^I am prevented from signing up and a message tells me that my surname is missing$/) do
  assert page.has_text?("Surname can't be blank")
end

When(/^I enter all information but the emal$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Then(/^I am prevented from signing up and a message tells me that my email is missing$/) do
  assert page.has_text?("Email can't be blank")
end

Then(/^I am signed in$/) do
  assert page.has_text?('Welcome! You have signed up successfully.')
end

Given(/^that I have chosen to sign up$/) do
  @role = FactoryGirl.create(:role, :role_name => "Tester")
  visit_mainpage
  page.click_link('Signup')
end

Given(/^I have entered all the needed details$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

When(/^I select the job role of "(.*?)"$/) do |job_role|
  page.select job_role, :from => 'user_role_id'
end

When(/^select to sign up$/) do
  click_signup
end

Then(/^the job role is saved correctly as "(.*?)" on my profile$/) do |job_role|
  page.click_link('My Profile')
  assert page.has_content?(job_role)
end

Given(/^has chosen to amend his profile$/) do
  page.click_link('My Profile')
  @role2 = FactoryGirl.create(:role, :role_name => "Kingslayer")
  page.click_link('Edit Profile') 
end

When(/^he choses the new job role of "(.*?)"$/) do |job_role|
  page.select job_role, :from => 'user_role_id'
end

When(/^saves his changes$/) do
  page.click_button('Update')
end

Then(/^"(.*?)" is saved correctly in his profile$/) do |job_role|
  page.click_link('My Profile')
  assert page.has_content?(job_role)
end
