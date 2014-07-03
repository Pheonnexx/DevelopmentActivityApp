require 'test_helper'

class DevActivitiesControllerTest < ActionController::TestCase
  setup do
    @dev_activity = dev_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dev_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dev_activity" do
    assert_difference('DevActivity.count') do
      post :create, dev_activity: {  }
    end

    assert_redirected_to dev_activity_path(assigns(:dev_activity))
  end

  test "should show dev_activity" do
    get :show, id: @dev_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dev_activity
    assert_response :success
  end

  test "should update dev_activity" do
    patch :update, id: @dev_activity, dev_activity: {  }
    assert_redirected_to dev_activity_path(assigns(:dev_activity))
  end

  test "should destroy dev_activity" do
    assert_difference('DevActivity.count', -1) do
      delete :destroy, id: @dev_activity
    end

    assert_redirected_to dev_activities_path
  end
end
