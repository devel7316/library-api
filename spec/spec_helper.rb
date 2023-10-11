#'
#'
#'
# this line or create your project iwth flag: -T 
require 'factory_bot'
#
RSpec.configure do |config|
  # 
  # add `FactoryBot` methods
  config.include FactoryBot::Syntax::Methods
  #
  # start by truncating all the tables but then use the faster transaction strategy the rest of the time.
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end
  #
  # start the transaction strategy as examples are run
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do 
      example.run 
    end 
  end

  #config.include RequestSpecHelper, type: :request
  
end