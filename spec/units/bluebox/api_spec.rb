require_relative '../../spec_helper'

describe Bluebox::API do
  before do
    Bluebox.configure do |config|
      config.consumer_key = "consumer-key"
      config.consumer_secret = "consumer-secret"
    end
  end
  
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new("oauth-token", "oauth-secret")
      @response = double('response', :body => {}, :code => 200)
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
          @client.should_receive(:get).with("people/~", {}).and_return(@response)
          @client.get_object('people', '~')
        end
      end
  
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234", {}).and_return(@response)
          @client.get_object('people', { :id => '1234' })
        end
      end
  
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com", {}).and_return(@response)
          @client.get_object('people', { :url => 'http://google.com' })
        end
      end
    end
  
    describe "#get_objects" do
      it "should make a GET request to the endpoint with multiple IDs" do
        @client.should_receive(:get).with("people::(1,2,3)", {}).and_return(@response)
        @client.get_objects('people', ['1', '2', '3'])
      end
    end
  
    describe "#get_collection" do
      context "by path" do
        it "should make a GET request to the endpoint with a path string" do
          @client.should_receive(:get).with("people/~/connections", {}).and_return(@response)
          @client.get_collection('people', '~', 'connections')
        end
      end
  
      context "by ID" do
        it "should make a GET request to the endpoint with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234/connections", {}).and_return(@response)
          @client.get_collection('people', { :id => 1234 }, 'connections')
        end
      end
  
      context "by URL" do
        it "should make a GET request to the endpoint with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com/connections", {}).and_return(@response)
          @client.get_collection('people', { :url => 'http://google.com' }, 'connections')
        end
      end
    end
  end
end