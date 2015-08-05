require 'test_helper'

class GclifeRegistrationsControllerTest < ActionController::TestCase
  setup do
    @gclife_registration = gclife_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gclife_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gclife_registration" do
    assert_difference('GclifeRegistration.count') do
      post :create, gclife_registration: { activeflag: @gclife_registration.activeflag, address1: @gclife_registration.address1, address2: @gclife_registration.address2, countrycode: @gclife_registration.countrycode, dob: @gclife_registration.dob, emergencycontact: @gclife_registration.emergencycontact, fullname: @gclife_registration.fullname, gender: @gclife_registration.gender, locationcode: @gclife_registration.locationcode, mobileno: @gclife_registration.mobileno, occupation: @gclife_registration.occupation, pincode: @gclife_registration.pincode, statecode: @gclife_registration.statecode, user_id: @gclife_registration.user_id }
    end

    assert_redirected_to gclife_registration_path(assigns(:gclife_registration))
  end

  test "should show gclife_registration" do
    get :show, id: @gclife_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gclife_registration
    assert_response :success
  end

  test "should update gclife_registration" do
    patch :update, id: @gclife_registration, gclife_registration: { activeflag: @gclife_registration.activeflag, address1: @gclife_registration.address1, address2: @gclife_registration.address2, countrycode: @gclife_registration.countrycode, dob: @gclife_registration.dob, emergencycontact: @gclife_registration.emergencycontact, fullname: @gclife_registration.fullname, gender: @gclife_registration.gender, locationcode: @gclife_registration.locationcode, mobileno: @gclife_registration.mobileno, occupation: @gclife_registration.occupation, pincode: @gclife_registration.pincode, statecode: @gclife_registration.statecode, user_id: @gclife_registration.user_id }
    assert_redirected_to gclife_registration_path(assigns(:gclife_registration))
  end

  test "should destroy gclife_registration" do
    assert_difference('GclifeRegistration.count', -1) do
      delete :destroy, id: @gclife_registration
    end

    assert_redirected_to gclife_registrations_path
  end
end
