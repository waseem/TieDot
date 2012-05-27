require 'test_helper'

class LsParliamentsControllerTest < ActionController::TestCase
  setup do
    @ls_parliament = ls_parliaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ls_parliaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ls_parliament" do
    assert_difference('LsParliament.count') do
      post :create, ls_parliament: { house_id: @ls_parliament.house_id, number: @ls_parliament.number }
    end

    assert_redirected_to ls_parliament_path(assigns(:ls_parliament))
  end

  test "should show ls_parliament" do
    get :show, id: @ls_parliament
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ls_parliament
    assert_response :success
  end

  test "should update ls_parliament" do
    put :update, id: @ls_parliament, ls_parliament: { house_id: @ls_parliament.house_id, number: @ls_parliament.number }
    assert_redirected_to ls_parliament_path(assigns(:ls_parliament))
  end

  test "should destroy ls_parliament" do
    assert_difference('LsParliament.count', -1) do
      delete :destroy, id: @ls_parliament
    end

    assert_redirected_to ls_parliaments_path
  end
end
