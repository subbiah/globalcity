require 'test_helper'

class ImportantContactsControllerTest < ActionController::TestCase
  setup do
    @important_contact = important_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:important_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create important_contact" do
    assert_difference('ImportantContact.count') do
      post :create, important_contact: { email: @important_contact.email, name: @important_contact.name, phno: @important_contact.phno }
    end

    assert_redirected_to important_contact_path(assigns(:important_contact))
  end

  test "should show important_contact" do
    get :show, id: @important_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @important_contact
    assert_response :success
  end

  test "should update important_contact" do
    patch :update, id: @important_contact, important_contact: { email: @important_contact.email, name: @important_contact.name, phno: @important_contact.phno }
    assert_redirected_to important_contact_path(assigns(:important_contact))
  end

  test "should destroy important_contact" do
    assert_difference('ImportantContact.count', -1) do
      delete :destroy, id: @important_contact
    end

    assert_redirected_to important_contacts_path
  end
end
