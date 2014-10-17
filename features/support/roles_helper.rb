module RoleHelper

	def view_role
		within(:xpath, "//div[@id='roles']/table") do
      click_link('Show')
  	end
  end		

  def edit_role
		within(:xpath, "//*[@id='roles']/table") do
      click_link('Edit', :match => :first)
  	end
  end

end

World(RoleHelper)