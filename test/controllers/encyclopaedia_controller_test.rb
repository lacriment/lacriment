require 'test_helper'

class EncyclopaediaControllerTest < ActionController::TestCase
  setup do
    @encyclopaedium = encyclopaedia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encyclopaedia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encyclopaedium" do
    assert_difference('Encyclopaedium.count') do
      post :create, encyclopaedium: { body: @encyclopaedium.body, title: @encyclopaedium.title }
    end

    assert_redirected_to encyclopaedium_path(assigns(:encyclopaedium))
  end

  test "should show encyclopaedium" do
    get :show, id: @encyclopaedium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encyclopaedium
    assert_response :success
  end

  test "should update encyclopaedium" do
    patch :update, id: @encyclopaedium, encyclopaedium: { body: @encyclopaedium.body, title: @encyclopaedium.title }
    assert_redirected_to encyclopaedium_path(assigns(:encyclopaedium))
  end

  test "should destroy encyclopaedium" do
    assert_difference('Encyclopaedium.count', -1) do
      delete :destroy, id: @encyclopaedium
    end

    assert_redirected_to encyclopaedia_path
  end
end
