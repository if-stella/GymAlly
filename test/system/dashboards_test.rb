require "application_system_test_case"

class DashboardsTest < ApplicationSystemTestCase
  test "visiting the dashboard as signed in" do
    login_as users(:kang)
    visit users_url
    assert_selector "h4", text: "People who are looking for an ally"
  end
end
