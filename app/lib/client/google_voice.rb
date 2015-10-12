module Client
  class GoogleVoice
    def send_text(opts)
      api.sms(opts[:to], opts[:content])
    end

    private

    def api
      @api ||= ::GoogleVoice::Api.new(
        ENV["GOOGLE_VOICE_USERNAME"], ENV["GOOGLE_VOICE_PASSWORD"]
      )
    end
  end
end
