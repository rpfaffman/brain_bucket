require 'spec_helper'

describe Parse do
  let(:parsed) { Parse.new(params) }
  let(:params) do
    {
      :date    => "Wed, 14 Oct 2015 01:23:37 +0000",
      :to      => "rpfaffman@gmail.com",
      :body    => body,
      :sender  => "\"Roy Pfaffman (SMS)\" <19495426769.16263908015.nFDTWj8c6w@txt.voice.google.com>",
      :subject => "SMS from Roy Pfaffman [(626) 390-8015]"
    }
  end
  let(:body) { "test\r\n" }

  describe "#identifier" do
    it "should parse the sender's name from the params" do
      expect(parsed.identifier).to eq("Roy Pfaffman")
    end
  end

  describe "#sms_number" do
    it "should parse the sender's number from the params" do
      expect(parsed.sms_number).to eq("6263908015")
    end
  end

  describe "#content" do
    it "should parse the body from the params" do
      expect(parsed.content).to eq("test")
    end
  end

  describe "#command" do
    let(:body) { "!command arg1 arg2\r\n" }
    it "should parse the body from the params" do
      expect(parsed.command).to eq(
        OpenStruct.new(
          prefix: "command",
          args:   ["arg1", "arg2"]
        )
      )
    end
  end
end
