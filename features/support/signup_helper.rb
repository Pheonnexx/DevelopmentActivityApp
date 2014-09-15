  
module SignupHelper

  def visit_mainpage
  	visit '/'
  end

  def click_signup
  	page.click_button('Signup!')
  end

  def login
  	visit_mainpage
  	page.click_link('Login')
  	page.fill_in "Email", :with => @user.email
  	page.fill_in "Password", :with => @user.password
  	page.click_button('Sign in')
  end 

  def login_generic_user
    @role = FactoryGirl.create(:role)
  	@user = FactoryGirl.create(:user, :role_id => @role.id)
  	login
  end

end

World(SignupHelper)