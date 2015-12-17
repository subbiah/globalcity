require 'test_helper'

class EventLikesControllerTest < ActionController::TestCase
  setup do
    @event_like = event_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_like" do
    assert_difference('EventLike.count') do
      post :create, event_like: { event_id: @event_like.event_id, user_id: @event_like.user_id }
    end

    assert_redirected_to event_like_path(assigns(:event_like))
  end

  test "should show event_like" do
    get :show, id: @event_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_like
    assert_response :success
  end

  test "should update event_like" do
    patch :update, id: @event_like, event_like: { event_id: @event_like.event_id, user_id: @event_like.user_id }
    assert_redirected_to event_like_path(assigns(:event_like))
  end

  test "should destroy event_like" do
    assert_difference('EventLike.count', -1) do
      delete :destroy, id: @event_like
    end

    assert_redirected_to event_likes_path
  end
end
