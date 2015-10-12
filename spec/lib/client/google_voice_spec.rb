require 'spec_helper'

describe Client::GoogleVoice do
  let(:client) { Client::GoogleVoice.new }

  describe "#send_text" do
    let(:opts) do
      {
        to: "1234567890",
        content: "a text string"
      }
    end

    it "should use GoogleVoice::Api to send the content as sms text" do
      expect_any_instance_of(
        GoogleVoice::Api
      ).to receive(:sms).with(opts[:to], opts[:content]) 
      client.send_text(opts)
    end
  end
end
