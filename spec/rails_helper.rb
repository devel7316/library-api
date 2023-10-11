# 
# * WITHOUT BLANK line
# some description.., (WITHOUT BLANK lines)
# * 
require 'spec_helper'        # * \\<--- rspec environment
ENV['RAILS_ENV'] ||= 'test'  # * \\<--- environment variable
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in produtcion mode!") if Rails.env.production?
#
# json helper into folder: spec/support. commented: NOT in use
#Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
#RSpec.configure do |config|
#  config.include RequestSpecHelper, type: :request
#end 

require 'rspec/rails'
# Add addtional requires below this line. Rails is not loaded until this point!
begin 
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecordo::PendingMigrationError => e
  abort e.to_S.strip  
end 

#
# as described at: https://www.microverse.org/blog/test-driven-development-of-restful-json-api-with-rails 
# require database_cleaner at the top level
require 'database_cleaner'
# configure shoulda matchers to use rspec as the test framework 
# and full matcher libraries for rails
Shoulda::Matchers.configure do |config|

  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end  

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end

