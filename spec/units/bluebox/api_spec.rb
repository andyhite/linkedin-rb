require_relative '../../spec_helper'

describe Bluebox::API do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get" do
      it "should make a GET request to the path with the requested fields" do
        @client.should_receive(:request).with(:get, "http://api.linkedin.com/v1/people/~:(id)?format=json")
        @client.get('people/~', ['id'], { :format => 'json' })
      end
    end
  end
end