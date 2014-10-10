require 'test_helper'

class UsersLinemanagersControllerTest < ActionController::TestCase
  setup do
    @users_linemanager = users_linemanagers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_linemanagers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_linemanager" do
    assert_difference('UsersLinemanager.count') do
      post :create, users_linemanager: {  }
    end

    assert_redirected_to users_linemanager_path(assigns(:users_linemanager))
  end

  test "should show users_linemanager" do
    get :show, id: @users_linemanager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_linemanager
    assert_response :success
  end

  test "should update users_linemanager" do
    patch :update, id: @users_linemanager, users_linemanager: {  }
    assert_redirected_to users_linemanager_path(assigns(:users_linemanager))
  end

  test "should destroy users_linemanager" do
    assert_difference('UsersLinemanager.count', -1) do
      delete :destroy, id: @users_linemanager
    end

    assert_redirected_to users_linemanagers_path
  end
end
