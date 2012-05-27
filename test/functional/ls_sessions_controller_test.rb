require 'test_helper'

class LsSessionsControllerTest < ActionController::TestCase
  setup do
    @ls_session = ls_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ls_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ls_session" do
    assert_difference('LsSession.count') do
      post :create, ls_session: { ls_parliament_id: @ls_session.ls_parliament_id, session_number: @ls_session.session_number }
    end

    assert_redirected_to ls_session_path(assigns(:ls_session))
  end

  test "should show ls_session" do
    get :show, id: @ls_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ls_session
    assert_response :success
  end

  test "should update ls_session" do
    put :update, id: @ls_session, ls_session: { ls_parliament_id: @ls_session.ls_parliament_id, session_number: @ls_session.session_number }
    assert_redirected_to ls_session_path(assigns(:ls_session))
  end

  test "should destroy ls_session" do
    assert_difference('LsSession.count', -1) do
      delete :destroy, id: @ls_session
    end

    assert_redirected_to ls_sessions_path
  end
end
