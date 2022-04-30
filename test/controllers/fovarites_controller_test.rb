require 'test_helper'

class FovaritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fovarites_create_url
    assert_response :success
  end

  test "should get destory" do
    get fovarites_destory_url
    assert_response :success
  end

end
