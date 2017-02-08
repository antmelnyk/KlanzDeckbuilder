require 'test_helper'

class LoginAccessTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "user have to login to see certain pages" do
    get root_path
    assert_response :success
    get cards_path
    assert_redirected_to new_user_session_path
    sign_in users(:test)
    users(:test).confirmed_at = Time.zone.now
    get cards_path
    assert_response :success
  end
end
