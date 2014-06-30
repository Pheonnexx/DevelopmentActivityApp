  
module SignupHelper

  def visit_mainpage
  	visit '/'
  	assert page.has_content?('Dev Activity App')
  end

  def click_signup
  	page.click_button('Signup!')
  end

end

World(SignupHelper)