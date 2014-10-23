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
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Given(/^that I am logged in as a Line Manager$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :line_manager, :role_id => @role.id)
  @line_manager = FactoryGirl.create(:linemanager, :user_id => @user.id)
  login
end

When(/^I navigate to add someone to my team$/) do
  page.click_link('Management Dashboard')
  page.click_link('Add to Team')
end

When(/^I search for "(.*?)" "(.*?)"$/) do |firstname, surname|
  @firstname = firstname
  page.fill_in "Search by First Name", :with => firstname
  page.fill_in "Search by Surname", :with => surname
  page.click_button('Search')
end

When(/^I select to add them$/) do
  assert page.has_text?(@firstname)
  page.click_button("Linemanage")
end

Given(/^I want to add "(.*?)" "(.*?)" to my team$/) do |firstname, surname|
  @user2 = FactoryGirl.create(:user, :first_name => firstname, :surname => surname,:role_id => @role.id)
end

Then(/^they are added to the team I line manage$/) do
  assert page.has_text?("Linemanaged by #{@user.first_name} #{@user.surname}")
end