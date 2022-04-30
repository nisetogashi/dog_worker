require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get customers_update_url
    assert_response :success
  end

  test "should get exit" do
    get customers_exit_url
    assert_response :success
  end

  test "should get withdraw" do
    get customers_withdraw_url
    assert_response :success
  end

  test "should get favorite_siiter" do
    get customers_favorite_siiter_url
    assert_response :success
  end

  test "should get review" do
    get customers_review_url
    assert_response :success
  end

end
