require 'devise'
require 'factory_girl_rails'
require "rails_helper"

# Automigrate if needs migration
if ActiveRecord::Migrator.needs_migration?
  ActiveRecord::Migrator.migrate(File.join(Rails.root, 'db/migrate'))
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Requests::JsonHelpers, type: :controller
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
  	DatabaseCleaner.clean_with(:truncation)
  	load "#{Rails.root}/db/seeds.rb" 
	end

  # ActiveRecord::Base.logger = Logger.new(STDOUT)

end


