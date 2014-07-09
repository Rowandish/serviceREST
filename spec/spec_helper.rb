require 'devise'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
