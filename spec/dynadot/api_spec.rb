require 'spec_helper'

describe Dynadot::Api do
  it "should include HTTParty methods" do
    expect(Dynadot::Api).to include(HTTParty)
  end

  it "should have the base url set to the Domain API endpoint" do
    expect(Dynadot::Api.base_uri).to eql 'https://api.dynadot.com/api2.html'
  end

  describe "#new" do
    it "requires a API key" do
      expect { Dynadot::Api.new }.to raise_error(ArgumentError)
    end
  end
end
