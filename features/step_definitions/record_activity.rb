Given(/^that "(.*?)" is logged in$/) do |first_name|
  @user = FactoryGirl.create(:user, :first_name => first_name)
  login
end

Then(/^she can choose the option to record a development activity$/) do
  assert page.has_link?('New Dev Activity')
end

When(/^she selects to record an activity$/) do
  page.click_link('New Dev Activity')
end

Then(/^she is directed to record development activity section$/) do
  assert page.has_content?('New Dev Activity')
end

Given(/^that "(.*?)" has chosen to record an activity$/) do |first_name|
  @user = FactoryGirl.create(:user, :first_name => first_name)
  login
  page.click_link('New Dev Activity')
end

Given(/^she records "(.*?)" as a development type$/) do |dev_type|
  page.fill_in "Development Type", :with => dev_type
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
  page.click_button('Create New Dev Activity')
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