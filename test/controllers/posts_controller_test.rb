require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get posts_profile_url
    assert_response :success
  end

end
