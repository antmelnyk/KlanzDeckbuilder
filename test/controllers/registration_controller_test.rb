require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  def setup
    @controller = Users::RegistrationsController.new
  end

  test 'register new user and confirmation send' do
    email = 'user@test.com'
    username = 'girl'
    @request.env["devise.mapping"] = Devise.mappings[:user]
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post :create, params: { user: {username: username, email: email,
                                     password: 'qwerty', password_confirmation: 'qwerty'}}
    end
    assert_equal 'user@test.com', User.find_by(email: email).email
  end

end