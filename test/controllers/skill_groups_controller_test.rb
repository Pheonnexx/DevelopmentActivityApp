require 'test_helper'

class SkillGroupsControllerTest < ActionController::TestCase
  setup do
    @skill_group = skill_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_group" do
    assert_difference('SkillGroup.count') do
      post :create, skill_group: {  }
    end

    assert_redirected_to skill_group_path(assigns(:skill_group))
  end

  test "should show skill_group" do
    get :show, id: @skill_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_group
    assert_response :success
  end

  test "should update skill_group" do
    patch :update, id: @skill_group, skill_group: {  }
    assert_redirected_to skill_group_path(assigns(:skill_group))
  end

  test "should destroy skill_group" do
    assert_difference('SkillGroup.count', -1) do
      delete :destroy, id: @skill_group
    end

    assert_redirected_to skill_groups_path
  end
end
