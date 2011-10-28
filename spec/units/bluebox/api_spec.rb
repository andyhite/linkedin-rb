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
      it "should make a GET request to the path with the specified options" do
        @client.should_receive(:request).with(:get, "http://api.linkedin.com/v1/people/~?format=json&option=value")
        @client.get('people/~', { :option => 'value' })
      end
    end
    
    describe "#get_object" do
      context "by path" do
        it "should make a GET request to the endpoint with a path string" do
          @client.should_receive(:get).with("people/~", {})
          @client.get_object('people', '~')
        end
      end
    
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234", {})
          @client.get_object('people', { :id => '1234' })
        end
      end
    
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com", {})
          @client.get_object('people', { :url => 'http://google.com' })
        end
      end
    end
    
    describe "#get_objects" do
      before do
        response = mock('response')
        response.stub(:[]) { 'value' }
        @client.stub(:get) { response }
      end
      
      it "should make a GET request to the endpoint with multiple IDs" do
        @client.should_receive(:get).with("people::(1,2,3)", {})
        @client.get_objects('people', ['1', '2', '3'])
      end
    end
    
    describe "#get_collection" do
      before do
        response = mock('response')
        response.stub(:[]) { 'value' }
        @client.stub(:get) { response }
      end
      
      context "by path" do
        it "should make a GET request to the endpoint with a path string" do
          @client.should_receive(:get).with("people/~/connections", {})
          @client.get_collection('people', '~', 'connections')
        end
      end
    
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234/connections", {})
          @client.get_collection('people', { :id => 1234 }, 'connections')
        end
      end
    
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com/connections", {})
          @client.get_collection('people', { :url => 'http://google.com' }, 'connections')
        end
      end
    end
  end
end