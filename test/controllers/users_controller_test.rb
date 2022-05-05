require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:kang)
  end

  test "should get index" do
    # get users_index_url
    get users_url
    assert_response :success
  end
end
