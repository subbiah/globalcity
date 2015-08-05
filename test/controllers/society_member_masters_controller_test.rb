require 'test_helper'

class SocietyMemberMastersControllerTest < ActionController::TestCase
  setup do
    @society_member_master = society_member_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:society_member_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create society_member_master" do
    assert_difference('SocietyMemberMaster.count') do
      post :create, society_member_master: { activeflag: @society_member_master.activeflag, building_id: @society_member_master.building_id, fullname: @society_member_master.fullname, gclife_id: @society_member_master.gclife_id, membertyper: @society_member_master.membertyper, mobileno: @society_member_master.mobileno, ownertype: @society_member_master.ownertype, society_id: @society_member_master.society_id }
    end

    assert_redirected_to society_member_master_path(assigns(:society_member_master))
  end

  test "should show society_member_master" do
    get :show, id: @society_member_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @society_member_master
    assert_response :success
  end

  test "should update society_member_master" do
    patch :update, id: @society_member_master, society_member_master: { activeflag: @society_member_master.activeflag, building_id: @society_member_master.building_id, fullname: @society_member_master.fullname, gclife_id: @society_member_master.gclife_id, membertyper: @society_member_master.membertyper, mobileno: @society_member_master.mobileno, ownertype: @society_member_master.ownertype, society_id: @society_member_master.society_id }
    assert_redirected_to society_member_master_path(assigns(:society_member_master))
  end

  test "should destroy society_member_master" do
    assert_difference('SocietyMemberMaster.count', -1) do
      delete :destroy, id: @society_member_master
    end

    assert_redirected_to society_member_masters_path
  end
end
