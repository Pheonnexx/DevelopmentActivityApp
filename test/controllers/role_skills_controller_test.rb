require 'test_helper'

class RoleSkillsControllerTest < ActionController::TestCase
  setup do
    @role_skill = role_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_skill" do
    assert_difference('RoleSkill.count') do
      post :create, role_skill: {  }
    end

    assert_redirected_to role_skill_path(assigns(:role_skill))
  end

  test "should show role_skill" do
    get :show, id: @role_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @role_skill
    assert_response :success
  end

  test "should update role_skill" do
    patch :update, id: @role_skill, role_skill: {  }
    assert_redirected_to role_skill_path(assigns(:role_skill))
  end

  test "should destroy role_skill" do
    assert_difference('RoleSkill.count', -1) do
      delete :destroy, id: @role_skill
    end

    assert_redirected_to role_skills_path
  end
end
