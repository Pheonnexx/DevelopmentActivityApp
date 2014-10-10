Then(/^there will be an option to view her profile$/) do
  assert page.has_link?('My Profile')
end

Given(/^that Heather Poole has logged in$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :role_id => @role.id)
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
  page.click_link('My Development Activities')
end

Then(/^he sees the dev activity for the book$/) do
  page.should have_text('My Development Activities')
  assert page.has_content?(@dev_activity.dev_type)
  assert page.has_content?("02/02/2012")
  assert page.has_content?(@dev_activity.time_taken)
  assert page.has_content?(@dev_activity.notes)
end

Given(/^that I am logged in as Betty$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => 'Betty', :role_id => @role.id)
  login
end

When(/^I view my profile$/) do
  page.click_link('My Profile')
end

Then(/^I should be given the option to change my password$/) do
  assert page.has_link?('Change Password')
end

Given(/^that "(.*?)" has chosen to change their password$/) do |first_name|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :role_id => @role.id)
  login
  page.click_link('My Profile')
  page.click_link('Change Password')
end

Given(/^they enter "(.*?)" as their new password$/) do |new_password|
  page.fill_in 'Password', :with => new_password
end

Given(/^enters "(.*?)" to confirm their password$/) do |password_confirmation|
  page.fill_in 'Password confirmation', :with => password_confirmation
end

When(/^they select to save their new password$/) do
  page.click_button('Update Password')
end

Then(/^they are informed that it has been changed successfully$/) do
  assert page.has_content?('Your password was successfully changed.')
end

Given(/^enters "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^they are informed that the passwords haven't been saved as there is a mismatch$/) do
  assert page.has_text?("Password confirmation doesn't match Password")
end

Given(/^they enter their current password$/) do
  page.fill_in 'Current password', :with => @user.password
end

Given(/^that I am logged in as "(.*?)" "(.*?)"$/) do |first_name, surname|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :surname => surname, :role_id => @role.id)
  login
end

When(/^I choose to edit my profile$/) do
  page.click_link('My Profile')
  page.click_link('Edit Profile')
end

When(/^amend the surname to "(.*?)"$/) do |surname|
  page.fill_in 'Surname', :with => surname
end

When(/^I enter my current password$/) do
  page.fill_in 'Current password', :with => @user.password
end

When(/^I select to update my profile$/) do
  page.click_button('Update')
end

Then(/^my surname is displayed correctly on my profile as "(.*?)"$/) do |surname|
  page.click_link('My Profile')
  assert page.has_content?(surname)
end

Then(/^I am not supplied an option to change my email address$/) do
  assert page.has_no_content?('Email')
end

Given(/^I have chosen to edit my profile$/) do
  page.click_link('My Profile')
  page.click_link('Edit Profile')
end

When(/^I have entered the needed profile changes$/) do
  page.fill_in 'First Name', :with => "Barbie"
end

When(/^I enter the current password incorrectly$/) do
  page.fill_in 'Current password', :with => "barbiedoll"
end

Then(/^I am displayed an error message and prevented from doing so$/) do
  page.has_text?('Current password is invalid')
end

When(/^I enter a new password$/) do
  page.fill_in 'Password', :with => 'dachshund1'
end

When(/^I confirm my new password$/) do
  page.fill_in 'Password confirmation', :with => 'dachshund1'
end

When(/^I enter my current password correctly$/) do
  page.fill_in 'Current password', :with => @user.password
end

Then(/^informs me that my profile has been updated correctly$/) do
  assert page.has_text?('You updated your account successfully.')
end

When(/^I enter a new password and confirm it$/) do
  page.fill_in 'Password', :with => 'dachshund1'
  page.fill_in 'Password confirmation', :with => 'dachshund1'
end

Then(/^enter my current password incorrectly$/) do
  page.fill_in 'Current password', :with => "barbiedoll"
end

Then(/^I am displayed an error concerning an incorrect password$/) do
  assert page.has_text?("Current password is invalid")
end

When(/^I enter a new password I confirm it incorrectly$/) do
  page.fill_in 'Password', :with => 'dachshund1'
  page.fill_in 'Password confirmation', :with => 'dachshund2'
end

Then(/^I am informed that one of my passwords are incorrect\.$/) do
  assert page.has_text?("Password confirmation doesn't match Password")
end

