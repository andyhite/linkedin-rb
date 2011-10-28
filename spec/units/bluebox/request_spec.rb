require_relative '../../spec_helper'

describe Bluebox::Request do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#request" do
      before do
        @response = mock('response')
        @response.stub(:code)
        @response.stub(:body)
        @access_token.stub(:get) { @response }
      end
      
      it "should make a GET request on the access token" do
        @access_token.should_receive(:get).with("test/path")
        @client.request(:get, "test/path")
      end
      
      it "should initialize a new response" do
        Bluebox::Response.should_receive(:new).with(@response)
        @client.request(:get, "test/path")
      end
    end
  end
end