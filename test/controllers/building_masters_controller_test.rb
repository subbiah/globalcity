require 'test_helper'

class BuildingMastersControllerTest < ActionController::TestCase
  setup do
    @building_master = building_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:building_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create building_master" do
    assert_difference('BuildingMaster.count') do
      post :create, building_master: { activeflag: @building_master.activeflag, buildinname: @building_master.buildinname, flatno: @building_master.flatno, flattype: @building_master.flattype, society_id: @building_master.society_id }
    end

    assert_redirected_to building_master_path(assigns(:building_master))
  end

  test "should show building_master" do
    get :show, id: @building_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @building_master
    assert_response :success
  end

  test "should update building_master" do
    patch :update, id: @building_master, building_master: { activeflag: @building_master.activeflag, buildinname: @building_master.buildinname, flatno: @building_master.flatno, flattype: @building_master.flattype, society_id: @building_master.society_id }
    assert_redirected_to building_master_path(assigns(:building_master))
  end

  test "should destroy building_master" do
    assert_difference('BuildingMaster.count', -1) do
      delete :destroy, id: @building_master
    end

    assert_redirected_to building_masters_path
  end
end
