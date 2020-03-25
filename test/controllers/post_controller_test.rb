require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get post_profile_url
    assert_response :success
  end

end
