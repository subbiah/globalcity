require 'test_helper'

class AssociationMastersControllerTest < ActionController::TestCase
  setup do
    @association_master = association_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:association_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create association_master" do
    assert_difference('AssociationMaster.count') do
      post :create, association_master: { activeflag: @association_master.activeflag, address1: @association_master.address1, address2: @association_master.address2, associationname: @association_master.associationname, citycode: @association_master.citycode, countrycode: @association_master.countrycode, districcode: @association_master.districcode, locationcode: @association_master.locationcode, pincode: @association_master.pincode, statecode: @association_master.statecode, township_id: @association_master.township_id }
    end

    assert_redirected_to association_master_path(assigns(:association_master))
  end

  test "should show association_master" do
    get :show, id: @association_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @association_master
    assert_response :success
  end

  test "should update association_master" do
    patch :update, id: @association_master, association_master: { activeflag: @association_master.activeflag, address1: @association_master.address1, address2: @association_master.address2, associationname: @association_master.associationname, citycode: @association_master.citycode, countrycode: @association_master.countrycode, districcode: @association_master.districcode, locationcode: @association_master.locationcode, pincode: @association_master.pincode, statecode: @association_master.statecode, township_id: @association_master.township_id }
    assert_redirected_to association_master_path(assigns(:association_master))
  end

  test "should destroy association_master" do
    assert_difference('AssociationMaster.count', -1) do
      delete :destroy, id: @association_master
    end

    assert_redirected_to association_masters_path
  end
end
