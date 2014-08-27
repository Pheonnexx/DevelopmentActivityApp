Given(/^that I am logged in as an admin$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :admin, :role_id => @role.id)
  @skill = FactoryGirl.create(:skill)
  login
end

Given(/^I select to add a new role$/) do
  page.click_link('Admin Dashboard')
  page.click_link('Manage Job Roles')
  page.click_link('New Job Role')
end

When(/^I enter the role name and description$/) do
  page.fill_in 'Role Name', :with => 'New Role'
  page.fill_in 'Role Description', :with => 'Role Description'
  page.click_link('remove skill')
end

When(/^I select to create the role$/) do
  page.click_button('Save Job Role')
end

Then(/^it is saved correctly$/) do
  page.has_text?('Role was successfully created.')
end

Given(/^there are three skills held in the app for "(.*?)", "(.*?)" and "(.*?)"$/) do |skill1, skill2, skill3|
  @skill1 = FactoryGirl.create(:skill, :skill_name => skill1)
  @skill2 = FactoryGirl.create(:skill, :skill_name => skill2)
  @skill3 = FactoryGirl.create(:skill, :skill_name => skill3)
end

Given(/^that I have chosen to create a job role$/) do
  page.click_link('Admin Dashboard')
  page.click_link('Manage Job Roles')
  page.click_link('New Job Role')
end

When(/^I have entered the role details$/) do
  page.fill_in 'Role Name', :with => 'New Role'
  page.fill_in 'Role Description', :with => 'Role Description'
end

When(/^I select the the skill "(.*?)"$/) do |skill|
  @skill_name = skill
  page.select @skill_name, :from => 'role_role_skills_attributes_0_skill_id'
end

When(/^I select to create the new role$/) do
  page.click_button('Save Job Role')
end

Then(/^it is successfully saved alongside the role skill$/) do
  page.has_text?(@skill_name)
end

Given(/^that I have chosen to edit a job role$/) do
  @role_skill = FactoryGirl.create(:role_skill, :role_id => @role.id, :skill_id => @skill.id)
  page.click_link('Admin Dashboard')
  page.click_link('Manage Job Roles')
  edit_role
end

When(/^I select to update the job role$/) do
  page.click_button('Save Job Role')
end