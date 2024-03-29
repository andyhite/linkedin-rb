require_relative '../../../spec_helper'

describe LinkedIn::API::Person do
  before do
    LinkedIn.configure do |config|
      config.consumer_key = "consumer-key"
      config.consumer_secret = "consumer-secret"
    end
  end
  
  describe "with an initialized client" do
    before do
      @client = LinkedIn::Client.new("oauth-token", "oauth-secret")
      @response = double('response', :body => {}, :code => 200)
      @client.stub(:get).and_return(@response)
    end
  
    describe "#get_me" do
      it "should request the currently authenticated person" do
        @client.should_receive(:get_person).with("~", {})
        @client.get_me
      end
    end
    
    describe "#get_my_connections" do
      it "should request the currently authenticated person's connections" do
        @client.should_receive(:get_person_connections).with("~", {})
        @client.get_my_connections
      end
    end
    
    describe "#get_my_memberships" do
      it "should request the currently authenticated person's memberships" do
        @client.should_receive(:get_person_memberships).with("~", {})
        @client.get_my_memberships
      end
    end
    
    describe "#get_my_suggestions" do
      it "should request the currently authenticated person's suggestions" do
        @client.should_receive(:get_person_suggestions).with("~", {})
        @client.get_my_suggestions
      end
    end
    
    describe "#get_my_followed_companies" do
      it "should request the currently authenticated person's followed companies" do
        @client.should_receive(:get_person_followed_companies).with("~", {})
        @client.get_my_followed_companies
      end
    end
    
    describe "#get_my_suggested_companies" do
      it "should request the currently authenticated person's suggested companies" do
        @client.should_receive(:get_person_suggested_companies).with("~", {})
        @client.get_my_suggested_companies
      end
    end
  
    describe "#get_person" do
      it "should make a GET request on /people/[params]" do
        @client.should_receive(:get).with("people/~", {})
        @client.get_person('~')
      end
    end
  
    describe "#get_person_connections" do
      it "should make a GET request on /people/[params]/connections" do
        @client.should_receive(:get).with("people/~/connections", {})
        @client.get_person_connections("~")
      end
    end
  
    describe "#get_person_memberships" do
      it "should make a GET request on /people/[params]/group-memberships" do
        @client.should_receive(:get).with("people/~/group-memberships", {})
        @client.get_person_memberships("~")
      end
    end
  
    describe "#get_person_suggestions" do
      it "should make a GET request on /people/[params]/suggestions/groups" do
        @client.should_receive(:get).with("people/~/suggestions/groups", {})
        @client.get_person_suggestions("~")
      end
    end
  
    describe "#get_person_followed_companies" do
      it "should make a GET request on /people/[params]/following/companies" do
        @client.should_receive(:get).with("people/~/following/companies", {})
        @client.get_person_followed_companies("~")
      end
    end
  
    describe "#get_person_suggested_companies" do
      it "should make a GET request on /people/[params]/suggestions/to-follow/companies" do
        @client.should_receive(:get).with("people/~/suggestions/to-follow/companies", {})
        @client.get_person_suggested_companies("~")
      end
    end
  
    describe "#get_people" do
      it "should make a GET request on /people::[ids]" do
        @client.should_receive(:get).with("people::(1,2,3)", {})
        @client.get_people(['1', '2', '3'])
      end
    end
  end
end