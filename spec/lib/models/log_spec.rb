require 'spec_helper'

describe Log do
  describe "#create" do
    let(:log) { Log.create(event: "POST /", dump: content) }
    let(:event) { "POST /" }
    let(:content) do
      { param_key: "value" }.to_s
    end
    let(:current_time) { Time.new("1/1/2015") }

    before do
      allow(Time).to receive(:now) { current_time }
    end

    it "should set created_at" do
      expect(log.created_at).to eq(current_time)
    end

    it "should add the dump content as a string" do
      expect(log.dump).to eq(content.to_s)
    end
  end
end
