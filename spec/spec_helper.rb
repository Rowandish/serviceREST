require 'devise'
require 'factory_girl_rails'
require 'support/controller_macros'
require 'support/devise_support'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, :type => :controller
  config.include ValidUserRequestHelper, :type => :controller
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end
