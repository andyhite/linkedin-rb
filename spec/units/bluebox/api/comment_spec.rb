require_relative '../../../spec_helper'

describe Bluebox::API::Comment do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @client.stub(:get) { Hash.new }
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