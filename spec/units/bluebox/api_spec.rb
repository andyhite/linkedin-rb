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
        @client.get('people/~', ['id'])
      end
      
      it "should make a GET request to the path with the specified options" do
        @client.should_receive(:request).with(:get, "http://api.linkedin.com/v1/people/~:(id)?format=json&option=value")
        @client.get('people/~', ['id'], { :option => 'value' })
      end
    end
    
    describe "#get_object" do
      context "by path" do
        it "should make a GET request to the endpoint with a path string" do
          @client.should_receive(:get).with("people/~", ['id'], {})
          @client.get_object('people', '~', ['id'])
        end
      end
    
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234", ['id'], {})
          @client.get_object('people', { :id => '1234' }, ['id'])
        end
      end
    
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com", ['id'], {})
          @client.get_object('people', { :url => 'http://google.com' }, ['id'])
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
        @client.should_receive(:get).with("people::(1,2,3)", ['id'], {})
        @client.get_objects('people', ['1', '2', '3'], ['id'])
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
          @client.should_receive(:get).with("people/~/connections", ['id'], {})
          @client.get_collection('people', '~', 'connections', ['id'])
        end
      end
    
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234/connections", ['id'], {})
          @client.get_collection('people', { :id => 1234 }, 'connections', ['id'])
        end
      end
    
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com/connections", ['id'], {})
          @client.get_collection('people', { :url => 'http://google.com' }, 'connections', ['id'])
        end
      end
    end
  end
end