require_relative '../../../spec_helper'

describe Bluebox::API::Group do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @client.stub(:get) { Hash.new }
    end
    
    describe "#get_group" do
      it "should make a GET request on /groups/[params]" do
        @client.should_receive(:get).with("groups/~", {})
        @client.get_group("~")
      end
    end
    
    describe "#get_group_posts" do
      it "should make a GET request on /groups/[params]/posts" do
        @client.should_receive(:get).with("groups/~/posts", {})
        @client.get_group_posts("~")
      end
    end
    
    describe "#get_groups" do
      it "should make a GET request on /groups::[ids]" do
        @client.should_receive(:get).with("groups::(1,2,3)", {})
        @client.get_groups(['1', '2', '3'])
      end
    end
  end
end