class App < Sinatra::Base
  configure do
    set :database, DB 
  end

  post '/' do
    current_user.create_neuron(parsed.content)
    respond_with_sms "Associated with #{current_user.current_neuron.title}"
    status 200
  end

  get '/' do
    haml :index
  end

  private

  # messages
  def respond_with_sms(msg)
    sms_client.send(
      to: parsed.sms_number,
      content: msg
    )
  end

  # objects
  def current_user
    @current_user ||= (
      attrs = {
        identifier: parsed.identifier,
        sms_number: parsed.sms_number.to_i
      }
      User.where(attrs).first || User.create(attrs)
    )
  end

  def sms_client
    @@sms_client ||= Client::GoogleVoice.new
  end

  def parsed; @parse ||= Parse.new(params) end
end
