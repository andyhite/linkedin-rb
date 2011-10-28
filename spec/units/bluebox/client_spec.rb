require_relative '../../spec_helper'
require 'oauth'

describe Bluebox::Client do  
  context "an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
    end
    
    it "sets the oauth token" do
      @client.oauth_token.should == "oauth-token"
    end
  
    it "sets the oauth secret" do
      @client.oauth_secret.should == "oauth-secret"
    end
    
    context "with configuration" do
      before do
        Bluebox.configure do |config|
          config.consumer_key = "consumer-key"
          config.consumer_secret = "consumer-secret"
        end
      end
    
      describe "#consumer" do
        it "should initialize an oauth consumer" do
          OAuth::Consumer.should_receive(:new).with("consumer-key", "consumer-secret")
          @client.consumer
        end
      end
      
      describe "#access_token" do
        before do
          @consumer = double('consumer')
          @client.stub(:consumer) { @consumer }
        end
        
        it "should initialize an oauth access token" do
          OAuth::AccessToken.should_receive(:new).with(@consumer, "oauth-token", "oauth-secret")
          @client.access_token
        end
      end
    end
  end
end