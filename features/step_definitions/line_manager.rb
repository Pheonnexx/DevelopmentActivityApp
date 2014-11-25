When(/^select that I have Line Manager duties$/) do
  page.check('user_line_manager')
end

When(/^I have saved my changes$/) do
  page.click_button('Update')
end

Then(/^I am given access to the Management Dashboard$/) do
  assert page.has_link?('Line Management Dashboard')
end

When(/^I enter my details correctly$/) do
  page.fill_in "First Name", :with => "Heather"
  page.fill_in "Surname", :with => "Poole"
  page.fill_in "Email", :with => "heather.poole@landregistry.gsi.gov.uk"
  page.fill_in "Password", :with => "bananas1"
  page.fill_in "Password Confirmation", :with => "bananas1"
end

Given(/^that I am logged in as a Line Manager$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :set_line_manager, :role_id => @role.id)
  @line_manager = FactoryGirl.create(:linemanager, :user_id => @user.id)
  login
end

When(/^I navigate to add someone to my team$/) do
  page.click_link('Line Management Dashboard')
  page.click_link('Add to Team')
end

When(/^I search for "(.*?)" "(.*?)"$/) do |firstname, surname|
  @firstname = firstname
  page.fill_in "Search by First Name", :with => firstname
  page.fill_in "Search by Surname", :with => surname
  page.click_button('Search')
end

When(/^I select to add them$/) do
  assert page.has_text?(@firstname)
  page.click_button("Linemanage")
end

Given(/^I want to add "(.*?)" "(.*?)" to my team$/) do |firstname, surname|
  @user2 = FactoryGirl.create(:user, :first_name => firstname, :surname => surname,:role_id => @role.id)
end

Then(/^they are added to the team I line manage$/) do
  assert page.has_text?("Linemanaged by #{@user.first_name} #{@user.surname}")
end

Given(/^that I am logged in as a Line manager$/) do
  @role = FactoryGirl.create(:role)
  @user = FactoryGirl.create(:user, :set_line_manager, :role_id => @role.id)
  @line_manager = FactoryGirl.create(:linemanager, :user_id => @user.id)
  login
end

Given(/^I linemanage "(.*?)", "(.*?)" and "(.*?)"$/) do |name1, name2, name3|
  @user1 = FactoryGirl.create(:user, :first_name => name1, :role_id => @role.id)
  @user2 = FactoryGirl.create(:user, :first_name => name2, :role_id => @role.id)
  @user3 = FactoryGirl.create(:user, :first_name => name3, :role_id => @role.id)
  @set_user_lm1 = FactoryGirl.create(:users_linemanager, :user_id => @user1.id, :linemanager_id => @line_manager.id)
  @set_user_lm2 = FactoryGirl.create(:users_linemanager, :user_id => @user2.id, :linemanager_id => @line_manager.id)
  @set_user_lm3 = FactoryGirl.create(:users_linemanager, :user_id => @user3.id, :linemanager_id => @line_manager.id)
end

Given(/^that I have selected to view my team$/) do
  page.click_link('Line Management Dashboard')
  page.click_link('View My Team')
end

Then(/^I can see all three people that I linemanage$/) do
  assert page.has_text?("#{@user1.first_name} #{@user1.surname}")
  assert page.has_text?("#{@user2.first_name} #{@user2.surname}")
  assert page.has_text?("#{@user3.first_name} #{@user3.surname}")
end

Given(/^I amd the linemanager of "(.*?)"$/) do |first_name|
  @user1 = FactoryGirl.create(:user, :first_name => first_name, :role_id => @role.id)
  @set_user_lm1 = FactoryGirl.create(:users_linemanager, :user_id => @user1.id, :linemanager_id => @line_manager.id)
end

When(/^I select to view his profile from the team list$/) do
  page.click_link('Line Management Dashboard')
  page.click_link('View My Team')
  page.click_link('View Profile')
end

Then(/^his profile is displayed$/) do
  pending # express the regexp above with the code you wish you had
end
