require "test_helper"

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meetups_index_url
    assert_response :success
  end

  test "should get new" do
    get meetups_new_url
    assert_response :success
  end

  test "should get create" do
    get meetups_create_url
    assert_response :success
  end

  test "should get update" do
    get meetups_update_url
    assert_response :success
  end

  test "should get destroy" do
    get meetups_destroy_url
    assert_response :success
  end
end
