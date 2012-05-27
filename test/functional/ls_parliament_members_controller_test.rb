require 'test_helper'

class LsParliamentMembersControllerTest < ActionController::TestCase
  setup do
    @ls_parliament_member = ls_parliament_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ls_parliament_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ls_parliament_member" do
    assert_difference('LsParliamentMember.count') do
      post :create, ls_parliament_member: { division_id: @ls_parliament_member.division_id, ls_parliament_id: @ls_parliament_member.ls_parliament_id, name: @ls_parliament_member.name }
    end

    assert_redirected_to ls_parliament_member_path(assigns(:ls_parliament_member))
  end

  test "should show ls_parliament_member" do
    get :show, id: @ls_parliament_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ls_parliament_member
    assert_response :success
  end

  test "should update ls_parliament_member" do
    put :update, id: @ls_parliament_member, ls_parliament_member: { division_id: @ls_parliament_member.division_id, ls_parliament_id: @ls_parliament_member.ls_parliament_id, name: @ls_parliament_member.name }
    assert_redirected_to ls_parliament_member_path(assigns(:ls_parliament_member))
  end

  test "should destroy ls_parliament_member" do
    assert_difference('LsParliamentMember.count', -1) do
      delete :destroy, id: @ls_parliament_member
    end

    assert_redirected_to ls_parliament_members_path
  end
end
