require_relative '../../../spec_helper'

describe Bluebox::API::Post do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @client.stub(:get) { Hash.new }
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