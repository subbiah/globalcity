require 'test_helper'

class FacilitatorSocietyMastersControllerTest < ActionController::TestCase
  setup do
    @facilitator_society_master = facilitator_society_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facilitator_society_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facilitator_society_master" do
    assert_difference('FacilitatorSocietyMaster.count') do
      post :create, facilitator_society_master: { activeflag: @facilitator_society_master.activeflag, category: @facilitator_society_master.category, city: @facilitator_society_master.city, country: @facilitator_society_master.country, createdby: @facilitator_society_master.createdby, emailid: @facilitator_society_master.emailid, facilitatorname: @facilitator_society_master.facilitatorname, location: @facilitator_society_master.location, mobilenumber2: @facilitator_society_master.mobilenumber2, mobilenumber: @facilitator_society_master.mobilenumber, pincode: @facilitator_society_master.pincode, society_id: @facilitator_society_master.society_id, state: @facilitator_society_master.state }
    end

    assert_redirected_to facilitator_society_master_path(assigns(:facilitator_society_master))
  end

  test "should show facilitator_society_master" do
    get :show, id: @facilitator_society_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facilitator_society_master
    assert_response :success
  end

  test "should update facilitator_society_master" do
    patch :update, id: @facilitator_society_master, facilitator_society_master: { activeflag: @facilitator_society_master.activeflag, category: @facilitator_society_master.category, city: @facilitator_society_master.city, country: @facilitator_society_master.country, createdby: @facilitator_society_master.createdby, emailid: @facilitator_society_master.emailid, facilitatorname: @facilitator_society_master.facilitatorname, location: @facilitator_society_master.location, mobilenumber2: @facilitator_society_master.mobilenumber2, mobilenumber: @facilitator_society_master.mobilenumber, pincode: @facilitator_society_master.pincode, society_id: @facilitator_society_master.society_id, state: @facilitator_society_master.state }
    assert_redirected_to facilitator_society_master_path(assigns(:facilitator_society_master))
  end

  test "should destroy facilitator_society_master" do
    assert_difference('FacilitatorSocietyMaster.count', -1) do
      delete :destroy, id: @facilitator_society_master
    end

    assert_redirected_to facilitator_society_masters_path
  end
end
