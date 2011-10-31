require_relative '../../../spec_helper'

describe Bluebox::API::Company do
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
    
    describe "#search_companies" do
      it "should make a GET request on /company-search?keywords=[keywords]" do
        @client.should_receive(:get).with("company-search", { :keywords => 'keyword' })
        @client.search_companies('keyword')
      end
    end
    
    describe "#get_company" do
      it "should make a GET request on /companies/[params]" do
        @client.should_receive(:get).with("companies/~", {})
        @client.get_company("~")
      end
    end
    
    describe "#get_companies" do
      it "should make a GET request on /companies::[ids]" do
        @client.should_receive(:get).with("companies::(1,2,3)", {})
        @client.get_companies(['1', '2', '3'])
      end
    end
  end
end