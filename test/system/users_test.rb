require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting dashboard as guest directs to login" do
    visit users_url
    # assert_selector "h2", text: "Log in"
    # assert_redirected_to new_user_session_path
    assert_equal new_user_session_path, page.current_path
  end

  test "user can login" do
    visit users_url
    # assert_selector "h2", text: "Log in"
    fill_in "Email", with: "kang@hsieh.com"
    fill_in "Password", with: "123456"
    # save_and_open_screenshot
    click_on "Log in"
    assert_equal users_path, page.current_path
  end

  test "visiting the dashboard as signed in" do
    login_as users(:kang)
    visit users_url
    assert_selector "h4", text: "People who are looking for an ally"
  end

  test "seeing users at your gym" do
    # login as user
    # seeing other users at your gym
  end

  test "filtering users" do
    # login as user
    # set filters
    # see filtered users
  end
end
