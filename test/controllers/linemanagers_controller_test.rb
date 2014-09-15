require 'test_helper'

class LinemanagersControllerTest < ActionController::TestCase
  setup do
    @linemanager = linemanagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linemanagers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linemanager" do
    assert_difference('Linemanager.count') do
      post :create, linemanager: { line_manager_id: @linemanager.line_manager_id, user_id: @linemanager.user_id }
    end

    assert_redirected_to linemanager_path(assigns(:linemanager))
  end

  test "should show linemanager" do
    get :show, id: @linemanager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linemanager
    assert_response :success
  end

  test "should update linemanager" do
    patch :update, id: @linemanager, linemanager: { line_manager_id: @linemanager.line_manager_id, user_id: @linemanager.user_id }
    assert_redirected_to linemanager_path(assigns(:linemanager))
  end

  test "should destroy linemanager" do
    assert_difference('Linemanager.count', -1) do
      delete :destroy, id: @linemanager
    end

    assert_redirected_to linemanagers_path
  end
end
