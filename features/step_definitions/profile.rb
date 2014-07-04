Then(/^there will be an option to view her profile$/) do
  assert page.has_link?('My Profile')
end

Given(/^that Heather Poole has logged in$/) do
  @user = FactoryGirl.create(:user)
  login
end

Given(/^has chosen to view her profile$/) do
  page.click_link('My Profile')
end

Then(/^her account details are displayed correctly$/) do
  assert page.has_content?(@user.first_name)
  assert page.has_content?(@user.surname)
  assert page.has_content?(@user.email)
  assert page.has_content?(@user.workgroup)
end

Given(/^has created a dev activity for reading the "(.*?)" called "(.*?)"$/) do |dev_type, notes|
  @dev_activity = FactoryGirl.create(:dev_activity, :dev_type => dev_type, :notes => notes, :user_id => @user.id)
end

When(/^he views his profile$/) do
  page.click_link('My Profile')
end

Then(/^he sees the dev activity for the book$/) do
  assert page.has_content?('My Development Activities')
  assert page.has_content?(@dev_activity.dev_type)
  assert page.has_content?("02/02/2012")
  assert page.has_content?(@dev_activity.time_taken)
  assert page.has_content?(@dev_activity.notes)
end