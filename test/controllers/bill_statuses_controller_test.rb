require 'test_helper'

class BillStatusesControllerTest < ActionController::TestCase
  setup do
    @bill_status = bill_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_status" do
    assert_difference('BillStatus.count') do
      post :create, bill_status: { bill_amt: @bill_status.bill_amt, building_master_id: @bill_status.building_master_id, deletion_flag: @bill_status.deletion_flag, fy: @bill_status.fy, month: @bill_status.month, society_master_id: @bill_status.society_master_id, status: @bill_status.status, upload_status: @bill_status.upload_status, user_id: @bill_status.user_id }
    end

    assert_redirected_to bill_status_path(assigns(:bill_status))
  end

  test "should show bill_status" do
    get :show, id: @bill_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_status
    assert_response :success
  end

  test "should update bill_status" do
    patch :update, id: @bill_status, bill_status: { bill_amt: @bill_status.bill_amt, building_master_id: @bill_status.building_master_id, deletion_flag: @bill_status.deletion_flag, fy: @bill_status.fy, month: @bill_status.month, society_master_id: @bill_status.society_master_id, status: @bill_status.status, upload_status: @bill_status.upload_status, user_id: @bill_status.user_id }
    assert_redirected_to bill_status_path(assigns(:bill_status))
  end

  test "should destroy bill_status" do
    assert_difference('BillStatus.count', -1) do
      delete :destroy, id: @bill_status
    end

    assert_redirected_to bill_statuses_path
  end
end
