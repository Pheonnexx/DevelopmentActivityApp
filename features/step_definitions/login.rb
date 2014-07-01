Given(/^that I have visited the mainpage$/) do
  visit_mainpage
end

Then(/^I am given the opportunity to login$/) do
  assert page.has_link?('Login')
end

Given(/^that I select to log in$/) do
  @user = FactoryGirl.create(:user)
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
  @user = FactoryGirl.create(:user, :first_name => first_name, :surname => surname)
  visit_mainpage
  page.click_link('Login')
  page.fill_in "Email", :with => @user.email
  page.fill_in "Password", :with => @user.password
end

Given(/^that I am logged in$/) do
  login_generic_user
end

Then(/^I am given the opportunity to logout$/) do
  assert page.has_link?('Logout')
end

When(/^I select to logout$/) do
  page.click_link('Logout')
end

Then(/^I am returned to the mainpage$/) do
  assert page.has_content?('Dev Activity App')
  assert page.has_link?('Login')
end