require './init'

class App < Sinatra::Base
  configure do
    set :database, DB 
  end

  post '/' do
    current_user.create_neuron(parsed.content)
    status 200
  end

  get '/' do
    haml :index
  end

  private

  def current_user
    @current_user ||= (
      User.where(identifier: parsed.sender).first ||
        User.create(identifier: parsed.sender)
    )
  end

  def parsed; @parse ||= Parse.new(params) end
end
