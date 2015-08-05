require 'test_helper'

class SocietyMastersControllerTest < ActionController::TestCase
  setup do
    @society_master = society_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:society_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create society_master" do
    assert_difference('SocietyMaster.count') do
      post :create, society_master: { activeflag: @society_master.activeflag, address1: @society_master.address1, address2: @society_master.address2, association_id: @society_master.association_id, citycode: @society_master.citycode, countrycode: @society_master.countrycode, districcode: @society_master.districcode, locationcode: @society_master.locationcode, pincode: @society_master.pincode, societyname: @society_master.societyname, statecode: @society_master.statecode }
    end

    assert_redirected_to society_master_path(assigns(:society_master))
  end

  test "should show society_master" do
    get :show, id: @society_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @society_master
    assert_response :success
  end

  test "should update society_master" do
    patch :update, id: @society_master, society_master: { activeflag: @society_master.activeflag, address1: @society_master.address1, address2: @society_master.address2, association_id: @society_master.association_id, citycode: @society_master.citycode, countrycode: @society_master.countrycode, districcode: @society_master.districcode, locationcode: @society_master.locationcode, pincode: @society_master.pincode, societyname: @society_master.societyname, statecode: @society_master.statecode }
    assert_redirected_to society_master_path(assigns(:society_master))
  end

  test "should destroy society_master" do
    assert_difference('SocietyMaster.count', -1) do
      delete :destroy, id: @society_master
    end

    assert_redirected_to society_masters_path
  end
end
