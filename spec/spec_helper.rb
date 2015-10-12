# initalize app in test environment
ENV["RACK_ENV"] = "test"
require_relative '../init'

# load test gems
Bundler.require(:test)

# configure rspec
RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) { `rake db:reset` }
  config.order = :random
  Kernel.srand config.seed
end
