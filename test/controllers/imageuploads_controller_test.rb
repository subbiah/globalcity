require 'test_helper'

class ImageuploadsControllerTest < ActionController::TestCase
  setup do
    @imageupload = imageuploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imageuploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imageupload" do
    assert_difference('Imageupload.count') do
      post :create, imageupload: { image: @imageupload.image }
    end

    assert_redirected_to imageupload_path(assigns(:imageupload))
  end

  test "should show imageupload" do
    get :show, id: @imageupload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imageupload
    assert_response :success
  end

  test "should update imageupload" do
    patch :update, id: @imageupload, imageupload: { image: @imageupload.image }
    assert_redirected_to imageupload_path(assigns(:imageupload))
  end

  test "should destroy imageupload" do
    assert_difference('Imageupload.count', -1) do
      delete :destroy, id: @imageupload
    end

    assert_redirected_to imageuploads_path
  end
end
