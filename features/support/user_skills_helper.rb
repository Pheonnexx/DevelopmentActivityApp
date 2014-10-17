module UserSkillHelper

	def view_user_skill
		within(:xpath, "//div[@id='user_skills']/table") do
      click_link('Show')
  	end
  end		

  def edit_user_skill
		within(:xpath, "//*[@id='user_skills']/table") do
      click_link('Edit', :match => :first)
  	end
  end

end

World(UserSkillHelper)