require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookings_index_url
    assert_response :success
  end

  test "should get show" do
    get bookings_show_url
    assert_response :success
  end

  test "should get create" do
    get bookings_create_url
    assert_response :success
  end

  test "should get chack" do
    get bookings_chack_url
    assert_response :success
  end

  test "should get complete" do
    get bookings_complete_url
    assert_response :success
  end

  test "should get destory" do
    get bookings_destory_url
    assert_response :success
  end

end
