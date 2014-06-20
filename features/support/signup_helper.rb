  
module SignupHelper

  def visit_mainpage
  	visit '/'
  	assert page.has_content?('Development Activity App')
  end

end

World(SignupHelper)