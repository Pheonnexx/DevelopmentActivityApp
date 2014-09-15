When(/^select that I have Line Manager duties$/) do
  page.check('user_line_manager')
end

When(/^I have saved my changes$/) do
  page.click_button('Update')
end

Then(/^I am given access to the Management Dashboard$/) do
  page.has_link?('Management Dashboard')
end

When(/^I enter my details correctly$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Work Group", :with => "Testing"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
  page.fill_in "Job Grade", :with => "RE2L"
  page.fill_in "Location", :with => "IS"
  page.fill_in "Team", :with => "Service Support"
end

Given(/^that I am logged in as a Line Manager$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :line_manager, :role_id => @role.id)
  login
end

When(/^I navigate to add someone to my team$/) do
  page.click_link('Management Dashboard')
  page.click_link('Add to Team')
end

When(/^I search for "(.*?)" "(.*?)"$/) do |firstname, surname|
  pending # express the regexp above with the code you wish you had
end

When(/^I select to add them$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they are added to the team I line manage$/) do
  pending # express the regexp above with the code you wish you had
end