require_relative '../../spec_helper'

describe Bluebox::CommentAPI do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get_comment" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("comments", "~", Bluebox::CommentAPI::FIELDS[:comment], {})
          @client.get_comment("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_object).with("comments", "~", ['id'], {})
          @client.get_comment('~', :fields => ['id'])
        end
      end
    end
  end
end