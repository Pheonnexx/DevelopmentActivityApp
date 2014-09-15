#This is the controller for my static pages - currently only has admin dashboard which is a menu for the admin functions

class PagesController < ApplicationController
	  before_filter :authenticate_user!
  
  def AdminDashboard
  
  end

  def LineManagerDashboard

  end

end
