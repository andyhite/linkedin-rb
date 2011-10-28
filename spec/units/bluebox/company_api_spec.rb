require_relative '../../spec_helper'

describe Bluebox::CompanyAPI do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get_company" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("companies", "~", Bluebox::CompanyAPI::FIELDS, {})
          @client.get_company("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_object).with("companies", "~", ['id'], {})
          @client.get_company('~', :fields => ['id'])
        end
      end
    end
  end
end