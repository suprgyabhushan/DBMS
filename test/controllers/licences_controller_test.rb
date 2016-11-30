require 'test_helper'

class LicencesControllerTest < ActionController::TestCase
  setup do
    @licence = licences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licence" do
    assert_difference('Licence.count') do
      post :create, licence: { agreement: @licence.agreement, end_time: @licence.end_time, ip_id: @licence.ip_id, licencee_id: @licence.licencee_id, licencee_type: @licence.licencee_type, payment_type: @licence.payment_type, royalty_to_pay: @licence.royalty_to_pay }
    end

    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should show licence" do
    get :show, id: @licence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licence
    assert_response :success
  end

  test "should update licence" do
    patch :update, id: @licence, licence: { agreement: @licence.agreement, end_time: @licence.end_time, ip_id: @licence.ip_id, licencee_id: @licence.licencee_id, licencee_type: @licence.licencee_type, payment_type: @licence.payment_type, royalty_to_pay: @licence.royalty_to_pay }
    assert_redirected_to licence_path(assigns(:licence))
  end

  test "should destroy licence" do
    assert_difference('Licence.count', -1) do
      delete :destroy, id: @licence
    end

    assert_redirected_to licences_path
  end
end
