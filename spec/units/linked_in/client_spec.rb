require_relative '../../spec_helper'

describe LinkedIn::Client do
  context "with configuration" do
    before do
      LinkedIn.configure do |config|
        config.consumer_key = "consumer-key"
        config.consumer_secret = "consumer-secret"
      end
    end
    
    context "an initialized client" do
      before do
        @client = LinkedIn::Client.new("oauth-token", "oauth-secret")
      end
    
      it "sets the oauth token" do
        @client.oauth_token.should == "oauth-token"
      end
  
      it "sets the oauth secret" do
        @client.oauth_secret.should == "oauth-secret"
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
  
  context "without configuration" do
    before do
      LinkedIn.configure do |config|
        config.consumer_key = nil
        config.consumer_secret = nil
      end
    end
    
    it "should raise an error" do
      expect do
        @client = LinkedIn::Client.new("oauth-token", "oauth-secret")
      end.to raise_error
    end
  end
end