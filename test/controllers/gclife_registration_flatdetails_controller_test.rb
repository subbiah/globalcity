require 'test_helper'

class GclifeRegistrationFlatdetailsControllerTest < ActionController::TestCase
  setup do
    @gclife_registration_flatdetail = gclife_registration_flatdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gclife_registration_flatdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gclife_registration_flatdetail" do
    assert_difference('GclifeRegistrationFlatdetail.count') do
      post :create, gclife_registration_flatdetail: { buildingid: @gclife_registration_flatdetail.buildingid, gclifeid: @gclife_registration_flatdetail.gclifeid, membertypeid: @gclife_registration_flatdetail.membertypeid, ownertypeid: @gclife_registration_flatdetail.ownertypeid, relationshipid: @gclife_registration_flatdetail.relationshipid, societyid: @gclife_registration_flatdetail.societyid, tenureend: @gclife_registration_flatdetail.tenureend, tenurestart: @gclife_registration_flatdetail.tenurestart }
    end

    assert_redirected_to gclife_registration_flatdetail_path(assigns(:gclife_registration_flatdetail))
  end

  test "should show gclife_registration_flatdetail" do
    get :show, id: @gclife_registration_flatdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gclife_registration_flatdetail
    assert_response :success
  end

  test "should update gclife_registration_flatdetail" do
    patch :update, id: @gclife_registration_flatdetail, gclife_registration_flatdetail: { buildingid: @gclife_registration_flatdetail.buildingid, gclifeid: @gclife_registration_flatdetail.gclifeid, membertypeid: @gclife_registration_flatdetail.membertypeid, ownertypeid: @gclife_registration_flatdetail.ownertypeid, relationshipid: @gclife_registration_flatdetail.relationshipid, societyid: @gclife_registration_flatdetail.societyid, tenureend: @gclife_registration_flatdetail.tenureend, tenurestart: @gclife_registration_flatdetail.tenurestart }
    assert_redirected_to gclife_registration_flatdetail_path(assigns(:gclife_registration_flatdetail))
  end

  test "should destroy gclife_registration_flatdetail" do
    assert_difference('GclifeRegistrationFlatdetail.count', -1) do
      delete :destroy, id: @gclife_registration_flatdetail
    end

    assert_redirected_to gclife_registration_flatdetails_path
  end
end
