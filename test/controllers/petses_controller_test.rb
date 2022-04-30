require 'test_helper'

class PetsesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petses_index_url
    assert_response :success
  end

  test "should get show" do
    get petses_show_url
    assert_response :success
  end

  test "should get edit" do
    get petses_edit_url
    assert_response :success
  end

  test "should get create" do
    get petses_create_url
    assert_response :success
  end

  test "should get update" do
    get petses_update_url
    assert_response :success
  end

end
