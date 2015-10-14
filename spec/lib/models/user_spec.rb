require 'spec_helper'

describe User do
  let(:user) {
    User.create(
      identifier: "Roy Pfaffman",
      sms_number: "6263908015"
    )
  }
  let(:current_time) { Time.new("1/1/2015") }

  before do
    allow(Time).to receive(:now) { current_time }
  end

  describe "#create" do
    it "should set created_at" do
      expect(user.created_at).to eq(current_time)
    end
  end
end
