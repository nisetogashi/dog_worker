require 'test_helper'

class ReviwsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reviws_create_url
    assert_response :success
  end

  test "should get destory" do
    get reviws_destory_url
    assert_response :success
  end

end
