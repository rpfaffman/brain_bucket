require 'json'

class App < Sinatra::Base
  configure do
    set :database, DB 
  end

  post '/' do
    begin
      Log.create(event: "POST /", dump: params)
      response = (process_command || process_content)
      respond_with_sms response || "Error: Invalid input."
      status 200
    rescue Exception => e
      respond_with_sms "ERROR: #{e.message}"
      raise e
    end
  end

  get '/' do
    @thoughts = Thought.all
    erb :index, locals: { thoughts: Thought.all }
  end

  get '/thoughts' do
    content_type :json
    status 200
    Thought.where(parent_id: nil).map(&:serialize).to_json
  end

  private

  # operations
  
  def process_command
    if command = parsed.command
      command_router.send(command.prefix, command.args)
    end
  end

  def process_content
    if parsed.content
      thought = current_user.think parsed.content
      "#{thought.parent.content} << #{thought.id}"
    end
  end

  def respond_with_sms(msg)
    sms_client.send_text(
      to: parsed.sms_number,
      content: msg
    )
  end

  # objects

  def current_user
    @current_user ||= (
      attrs = {
        identifier: parsed.identifier,
        sms_number: parsed.sms_number.to_s
      }
      User.find_or_create(attrs)
    )
  end

  def command_router; @command_router ||= CommandRouter.new(current_user) end
  def parsed; @parse ||= Parse.new(params) end
  def sms_client; @@sms_client ||= Client::GoogleVoice.new end
end
