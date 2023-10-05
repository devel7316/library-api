# 
# * WITHOUT BLANK line
# some description.., (WITHOUT BLANK lines)
# * 
require 'spec_helper'        # * \\<--- rspec environment
ENV['RAILS_ENV'] ||= 'test'  # * \\<--- environment variable
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in produtcion mode!") if Rails.env.production?
require 'rspec/rails'
# Add addtional requires below this line. Rails is not loaded until this point!

begin 
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecordo::PendingMigrationError => e
  abort e.to_S.strip  
end 
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  
end
  