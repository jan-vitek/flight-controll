require 'test_helper'

class AktualnisControllerTest < ActionController::TestCase
  setup do
    @aktualni = aktualnis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aktualnis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aktualni" do
    assert_difference('Aktualni.count') do
      post :create, aktualni: { begin: @aktualni.begin, pilot: @aktualni.pilot }
    end

    assert_redirected_to aktualni_path(assigns(:aktualni))
  end

  test "should show aktualni" do
    get :show, id: @aktualni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aktualni
    assert_response :success
  end

  test "should update aktualni" do
    put :update, id: @aktualni, aktualni: { begin: @aktualni.begin, pilot: @aktualni.pilot }
    assert_redirected_to aktualni_path(assigns(:aktualni))
  end

  test "should destroy aktualni" do
    assert_difference('Aktualni.count', -1) do
      delete :destroy, id: @aktualni
    end

    assert_redirected_to aktualnis_path
  end
end
