require 'test_helper'

class TownshipMastersControllerTest < ActionController::TestCase
  setup do
    @township_master = township_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:township_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create township_master" do
    assert_difference('TownshipMaster.count') do
      post :create, township_master: { activeflag: @township_master.activeflag, address1: @township_master.address1, address2: @township_master.address2, citycode: @township_master.citycode, countrycode: @township_master.countrycode, districtcode: @township_master.districtcode, locationcode: @township_master.locationcode, pincode: @township_master.pincode, satecode: @township_master.satecode, townshipname: @township_master.townshipname }
    end

    assert_redirected_to township_master_path(assigns(:township_master))
  end

  test "should show township_master" do
    get :show, id: @township_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @township_master
    assert_response :success
  end

  test "should update township_master" do
    patch :update, id: @township_master, township_master: { activeflag: @township_master.activeflag, address1: @township_master.address1, address2: @township_master.address2, citycode: @township_master.citycode, countrycode: @township_master.countrycode, districtcode: @township_master.districtcode, locationcode: @township_master.locationcode, pincode: @township_master.pincode, satecode: @township_master.satecode, townshipname: @township_master.townshipname }
    assert_redirected_to township_master_path(assigns(:township_master))
  end

  test "should destroy township_master" do
    assert_difference('TownshipMaster.count', -1) do
      delete :destroy, id: @township_master
    end

    assert_redirected_to township_masters_path
  end
end
