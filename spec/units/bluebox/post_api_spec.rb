require_relative '../../spec_helper'

describe Bluebox::PostAPI do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get_post" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("posts", "~", Bluebox::PostAPI::FIELDS[:post], {})
          @client.get_post("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_object).with("posts", "~", ['id'], {})
          @client.get_post('~', :fields => ['id'])
        end
      end
    end
  end
end