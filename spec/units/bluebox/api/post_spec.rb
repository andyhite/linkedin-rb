require_relative '../../../spec_helper'

describe Bluebox::API::Post do
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
      @client.stub(:get).and_return(@response)
    end
    
    describe "#get_post" do
      it "should make a GET request on /posts/[params]" do
        @client.should_receive(:get).with("posts/~", {})
        @client.get_post("~")
      end
    end
    
    describe "#get_posts" do
      it "should make a GET request on /posts::[ids]" do
        @client.should_receive(:get).with("posts::(1,2,3)", {})
        @client.get_posts(['1', '2', '3'])
      end
    end
  end
end