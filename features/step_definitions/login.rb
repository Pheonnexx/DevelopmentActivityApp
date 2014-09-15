Given(/^that I have visited the mainpage$/) do
  visit_mainpage
end

Then(/^I am given the opportunity to login$/) do
  assert page.has_link?('Login')
end

Given(/^that I select to log in$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :role_id => @role.id)
end

When(/^I enter a correct email and password$/) do
    visit_mainpage
  	page.click_link('Login')
  	page.fill_in "Email", :with => @user.email
  	page.fill_in "Password", :with => @user.password
end

When(/^select to login with that information$/) do
    page.click_button('Sign in')
end

Then(/^I log in successfully$/) do
  assert page.has_content?('Signed in successfully.')
end

Given(/^selects to login$/) do
  page.click_button('Sign in')
end

Then(/^she is informed that she has signed in correctly$/) do
  assert page.has_content?('Signed in successfully.')
end

Given(/^that "(.*?)" "(.*?)" has entered the correct login information$/) do |first_name, surname|
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :first_name => first_name, :surname => surname, :role_id => @role.id)
  visit_mainpage
  page.click_link('Login')
  page.fill_in "Email", :with => @user.email
  page.fill_in "Password", :with => @user.password
end

Given(/^that I am logged in$/) do
  login_generic_user
end

Then(/^I am given the opportunity to logout$/) do
  assert page.has_button?('Logout')
end

When(/^I select to logout$/) do
  page.click_button('Logout')
end

Then(/^I am returned to the mainpage$/) do
  assert page.has_link?('Login')
end

Given(/^that I have an account for the development activity app$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :email => "pheonn@hotmail.co.uk", :role_id => @role.id)
end

When(/^I select to "(.*?)"$/) do |button|
  visit_mainpage
  page.click_link(button)
end

Then(/^I am provided the option to retrieve my password$/) do
  page.has_link?('Forgot your password?')
end

Given(/^that I have an account with the email "(.*?)"$/) do |email|
  @role = FactoryGirl.create(:role)
  @user1 = FactoryGirl.create(:user, :email => email, :role_id => @role.id)
end

When(/^I select the option to retrieve my password$/) do
  visit_mainpage
  page.click_link('Login')
  page.click_link('Forgot your password?')
end

When(/^enter my email$/) do
  page.fill_in "Email", :with => @user1.email
end

When(/^I select to retrieve my password$/) do
  page.click_button('Send me reset password instructions')
end

Then(/^a password retrieval email is sent$/) do
  @email = ActionMailer::Base.deliveries.last
  @email.to.should include @user1.email
end

Given(/^I have selected the option to retrieve my password$/) do
  visit_mainpage
  page.click_link('Login')
  page.click_link('Forgot your password?')
  page.fill_in "Email", :with => @user1.email
  page.click_button('Send me reset password instructions')
end

When(/^I enter the new password of "(.*?)" and confirm it$/) do |password|
  token = extract_token_from_email(:reset_password)
  visit edit_user_password_path(reset_password_token: token)
  page.fill_in "New Password", :with => password
  page.fill_in "Confirm new password", :with => password
end

When(/^I select to submit my new password$/) do
  page.click_button('Change my password')
end

Then(/^I am signed in successfully with the new password$/) do
  assert page.has_content?('Your password was changed successfully. You are now signed in.')
end

