require_relative '../../spec_helper'

describe Bluebox::PersonAPI do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get_person" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get).with("people/~", Bluebox::PersonAPI::FIELDS)
          @client.get_person(:path => '~')
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get).with("people/~", ['first-name'])
          @client.get_person(:path => '~', :fields => ['first-name'])
        end
      end
      
      context "by path" do
        it "should make a GET request to people/ with a path string" do
          @client.should_receive(:get).with("people/~", Bluebox::PersonAPI::FIELDS)
          @client.get_person(:path => '~')
        end
      end
    
      context "by ID" do
        it "should make a GET request to people/ with an ID parameter" do
          @client.should_receive(:get).with("people/id=1234", Bluebox::PersonAPI::FIELDS)
          @client.get_person(:id => 1234)
        end
      end
    
      context "by URL" do
        it "should make a GET request to people/with a URL parameter" do
          @client.should_receive(:get).with("people/url=http%3A%2F%2Fgoogle.com", Bluebox::PersonAPI::FIELDS)
          @client.get_person(:url => 'http://google.com')
        end
      end
    end
  end
end