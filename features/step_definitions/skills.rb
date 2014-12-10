Then(/^I am given the option to select a skill to add to my profile$/) do
  page.click_link('My Profile')
  page.click_link('My Skills')
  assert page.has_link?('Add Skill')
end

Given(/^I have selected to add a skill$/) do
  page.click_link('My Profile')
  page.click_link('My Skills')
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  page.click_link('Add Skill')
end

When(/^I select 'MS Word' for the skill$/) do
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  page.select "MS Word", :from => 'user_skill_skill_id'
end

When(/^I select the skill level of "(.*?)"$/) do |skill_level|
  page.select skill_level, :from => 'Skill Level'
end

When(/^I select to save$/) do
  page.click_button('Confirm')
end

Then(/^I am returned to my skills with a successful save message$/) do
  assert page.has_text?('User skill was successfully created.')
end

Given(/^I have added a skill called 'MS Word' with a skill level of "(.*?)"$/) do |skill_level|
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  @user_skill = FactoryGirl.create(:user_skill, :skill_id => @skill.id, :user_id => @user.id, :skill_level => skill_level)
end

When(/^select to view my skills$/) do
  page.click_link('My Profile')
  page.click_link('My Skills')
end

Then(/^I can see that I have the skill 'MS Word' with the skill level of "(.*?)"$/) do |skill_level|
  assert page.has_text?('MS Word')
  assert page.has_content?(skill_level)
end

Given(/^I have select the skill last used date of "(.*?)"$/) do |last_used_date|
  page.select last_used_date, :from => 'Skill Last Used'
end

Given(/^I have entered all required information$/) do
  page.select "Testing", :from => 'user_skill_skill_id'
  page.select "Basic", :from => 'Skill Level'
end

When(/^I select to save the skill$/) do
  page.click_button("Confirm")
end

Then(/^it is displayed with the skill last used date of "(.*?)"$/) do |last_used_date|
  assert page.has_content?(last_used_date)
end

Given(/^that I have chosen to edit my skill of "(.*?)"$/) do |skill_name|
  @skill = FactoryGirl.create(:skill, :skill_name => skill_name)
  @user_skill = FactoryGirl.create(:user_skill, :skill_id => @skill.id, :user_id => @user.id)
  page.click_link('My Profile')
  page.click_link('My Skills')
  edit_user_skill
end

Given(/^I have selected the skill last used date of "(.*?)"$/) do |last_used_date|
  page.select last_used_date, :from => 'Skill Last Used'
end

Given(/^that I have logged in$/) do
  login_generic_user
end

Given(/^that I have chosen to add a new skill$/) do
  @skill = FactoryGirl.create(:skill, :skill_name => 'Testing')
  page.click_link('My Profile')
  page.click_link('My Skills')
  page.click_link('Add Skill')
end

When(/^I enter the role group name and description$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^there are three skill groups held in the app for "(.*?)", "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given(/^that I have chosen to create a job group$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I have entered the role group details$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select the the skill group "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I select to create the new role group$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^it is successfully saved alongside the associated skill groups$/) do
  pending # express the regexp above with the code you wish you had
end
