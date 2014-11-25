Given(/^that I am logged in as an Admin User$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :admin, :role_id => @role.id)
  login
end

Given(/^I have gone to the admin dashboard$/) do
  page.click_link('Admin Dashboard')
end

Then(/^I am given the option to Add a New Skill$/) do
  page.click_link('Manage Skills')
  assert page.has_link?('Add New Skill')
end

Given(/^I have selected to create a new skill$/) do
  page.click_link('Admin Dashboard')
  page.click_link('Manage Skills')
  page.click_link('Add New Skill')
end

Given(/^I have entered the new skills details$/) do
  @skill_name = 'Fundamentals'
  @skill_code = 'FUN5.2'
  @skill_type = 'Basics'
  page.fill_in 'Skill Name', :with => @skill_name
  page.fill_in 'Skill Code', :with => @skill_code
  page.fill_in 'Skill Type', :with => @skill_type
end

When(/^I select to save it$/) do
  page.click_button('Create Skill')
end

Then(/^its displayed with the correct details$/) do
  assert page.has_text?(@skill_name)
  assert page.has_text?(@skill_code)
  assert page.has_text?(@skill_type)
end

Given(/^I am currently on the admin dashboard$/) do
  page.click_link('Admin Dashboard')
end

Given(/^that I select to manage users$/) do
  create_generic_user
  page.click_link('Manage Users')
end

Given(/^it displays a list of users$/) do
  page.should have_text('User Index')
end

When(/^I select to delete a user$/) do
  delete_user
end

When(/^I confirm that I want to delete them$/) do
  page.driver.browser.switch_to.alert.accept
end

When(/^I select to manage users and search for "(.*?)" "(.*?)"$/) do |firstname, surname|
  @user1 = FactoryGirl.create(:user, :first_name => firstname, :surname => surname, :role_id => @role.id)
  page.click_link('Admin Dashboard')
  page.click_link('Manage Users')
  page.fill_in 'Surname', :with => @user1.surname
  page.click_button('Search')
end

When(/^select to view their profile$/) do
  page.click_link('Profile')
end

Then(/^I am displayed the profile of "(.*?)" "(.*?)"$/) do |first_name, surname|
  assert page.has_text?("#{first_name} #{surname}'s Profile")
end
