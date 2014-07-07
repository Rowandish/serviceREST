require 'devise'
require 'factory_girl_rails'
require 'support/controller_macros'
require 'support/devise_support'

module ControllerHelpers
    def sign_in(user = double('user'))
      if user.nil?
        allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
        allow(controller).to receive(:current_user).and_return(nil)
      else
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)
      end
    end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :controller
  config.extend ControllerMacros, :type => :controller
  config.include ControllerHelpers, :type => :controller
  config.include ValidUserRequestHelper, :type => :controller
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Warden.test_mode!
