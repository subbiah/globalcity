require 'test_helper'

class EventimagesControllerTest < ActionController::TestCase
  setup do
    @eventimage = eventimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventimage" do
    assert_difference('Eventimage.count') do
      post :create, eventimage: { event_id: @eventimage.event_id, image_type: @eventimage.image_type, image_url: @eventimage.image_url }
    end

    assert_redirected_to eventimage_path(assigns(:eventimage))
  end

  test "should show eventimage" do
    get :show, id: @eventimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventimage
    assert_response :success
  end

  test "should update eventimage" do
    patch :update, id: @eventimage, eventimage: { event_id: @eventimage.event_id, image_type: @eventimage.image_type, image_url: @eventimage.image_url }
    assert_redirected_to eventimage_path(assigns(:eventimage))
  end

  test "should destroy eventimage" do
    assert_difference('Eventimage.count', -1) do
      delete :destroy, id: @eventimage
    end

    assert_redirected_to eventimages_path
  end
end
