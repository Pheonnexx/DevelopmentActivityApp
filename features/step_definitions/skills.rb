Then(/^I am given the option to select a skill to add to my profile$/) do
  assert page.has_link?('Add Skill')
end

Given(/^I have selected to add a skill$/) do
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  page.click_link('Add Skill')
end

When(/^I select 'MS Word' for the skill$/) do
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  page.select "MS Word", :from => 'user_skill_skill_id'
end

When(/^I select the skill level of '(\d+)'$/) do |skill_level|
  page.select skill_level, :from => 'Skill Level'
end

When(/^I select to save$/) do
  page.click_button('Add Skill')
end

Then(/^I am returned to my profile with a successful save message$/) do
  assert page.has_text?('User skill was successfully created.')
  assert page.has_text?(@user.first_name)
end

Given(/^I have added a skill called 'MS Word' with a skill level of '(\d+)'$/) do |skill_level|
  @skill = FactoryGirl.create(:skill, :skill_name => 'MS Word')
  @user_skill = FactoryGirl.create(:user_skill, :skill_id => @skill.id, :user_id => @user.id, :skill_level => skill_level)
end

When(/^select to view my skills$/) do
  page.click_link('My Profile')
  page.click_link('My Skills')
end

Then(/^I can see that I have the skill 'MS Word' with the skill level of '(\d+)'$/) do |skill_level|
  assert page.has_text?('MS Word')
  assert page.has_content?(skill_level)
end