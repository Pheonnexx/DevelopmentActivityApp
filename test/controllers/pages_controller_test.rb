require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get AdminDashboard" do
    get :AdminDashboard
    assert_response :success
  end

end
