require 'rubygems'
require 'bundler'
Bundler.require(:default)

# set environmental variables before initializing
if [:development, :test].include?(Sinatra::Base.environment)
  Dotenv.load(File.expand_path("../.env.#{Sinatra::Base.environment}", __FILE__))
end

# run initializers
Dir['./app/initializers/**/*.rb'].each { |file| require file }

# load lib
Dir['./app/lib/**/*.rb'].each { |file| require file }

# load models
Dir['./app/models/**/*.rb'].each { |file| require file }

require './app'
