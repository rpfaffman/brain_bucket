require 'spec_helper'

describe Parse do
  let(:parsed) { Parse.new(params) }
  let(:params) do
    {
      subject: "something here"
    }
  end
end
