Given(/^that I am logged in as an admin$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :admin, :role_id => @role.id)
  login
end

Given(/^I select to add a new role$/) do
  page.click_link('Admin Dashboard')
  page.click_link('Add New Job Role')
end

When(/^I enter the role name and description$/) do
  page.fill_in 'Role Name', :with => 'New Role'
  page.fill_in 'Role Description', :with => 'Role Description'
end

When(/^I select to create the role$/) do
  page.click_button('Create Role')
end

Then(/^it is saved correctly$/) do
  page.has_text?('Role was successfully created.')
end