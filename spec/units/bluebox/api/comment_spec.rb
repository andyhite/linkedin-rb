require_relative '../../../spec_helper'

describe Bluebox::API::Comment do
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
    
    describe "#get_comment" do
      it "should make a GET request on /comments/[params]" do
        @client.should_receive(:get).with("comments/~", {})
        @client.get_comment("~")
      end
    end
    
    describe "#get_comments" do
      it "should make a GET request on /comments::[ids]" do
        @client.should_receive(:get).with("comments::(1,2,3)", {})
        @client.get_comments(['1', '2', '3'])
      end
    end
  end
end