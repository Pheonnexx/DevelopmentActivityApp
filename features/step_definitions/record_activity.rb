
Given(/^that "(.*?)" is logged in$/) do |first_name|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :role_id => @role.id)
  login
end

Then(/^she can choose the option to record a development activity$/) do
  page.click_link('My Profile')
  page.click_link("My Development Activities")
  assert page.has_link?('Add Development Activity')
end

When(/^she selects to record an activity$/) do
  page.click_link('Add Development Activity')
end

Then(/^she is directed to record development activity section$/) do
  page.should have_text('Add Development Activity')
end

Given(/^that "(.*?)" has chosen to record an activity$/) do |first_name|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :role_id => @role.id)
  login
  page.click_link('My Profile')
  page.click_link("My Development Activities")
  page.click_link('Add Development Activity')
end

Given(/^she records "(.*?)" as a development type$/) do |dev_type|
  page.select dev_type, :from => "Development Type"
  @dev_type = dev_type
end

Given(/^she records she completed the activity on the "(.*?)"$/) do |activity_date|
  page.fill_in "Date Completed", :with => activity_date
  @activity_date = activity_date
end

Given(/^she records "(.*?)" hours as the time it took her$/) do |activity_duration|
  page.fill_in "Time Taken", :with => activity_duration
  @activity_duration = activity_duration
end

Given(/^she records in notes that it was "(.*?)"$/) do |activity_notes|
  page.fill_in "Notes", :with => activity_notes
  @activity_notes = activity_notes
end

When(/^she submits this$/) do
  page.click_button('Confirm')
end

Then(/^it is saved$/) do
  assert page.has_content?('Dev activity was successfully created.')
end

Then(/^the activity is displayed to her$/) do
  assert page.has_content?(@dev_type)
  assert page.has_content?(@activity_date)
  assert page.has_content?(@activity_duration)
  assert page.has_content?(@activity_notes)
end

Given(/^that I have logged in as "(.*?)"$/) do |first_name|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :role_id => @role.id)
  login
end

When(/^I add a development activity$/) do
  create_dev_activity
end

When(/^I enter "(.*?)"$/) do |key_learning_point|
  page.fill_in "Key Learning Points", :with => key_learning_point
  @key_learning_point = key_learning_point
end

When(/^I select to save the development activity$/) do
  page.click_button('Confirm')
end

Then(/^the key learning point is displayed as part of the development activity$/) do
  assert page.has_content?(@key_learning_point)
end

When(/^I add a development activity without a key learning point$/) do
  create_dev_activity
end

Then(/^the development activity is displayed without a key learning point$/) do
  assert page.has_content?('Key Learning Points:')
end

