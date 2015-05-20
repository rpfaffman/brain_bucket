require 'rubygems'
require 'bundler'
Bundler.require
Dotenv.load

# run initializers
Dir['./app/initializers/**/*.rb'].each { |file| require file }

# load models
Dir['./app/models/**/*.rb'].each { |file| require file }

# load lib
Dir['./app/lib/**/*.rb'].each { |file| require file }
