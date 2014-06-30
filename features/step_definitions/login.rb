Given(/^that I have visited the mainpage$/) do
  visit_mainpage
end

Then(/^I am given the opportunity to login$/) do
  assert page.has_link?('Login')
end