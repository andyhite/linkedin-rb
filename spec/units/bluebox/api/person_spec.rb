require_relative '../../../spec_helper'

describe Bluebox::API::Person do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @client.stub(:get) { Hash.new }
    end
    
    describe "#get_me" do
      it "should request the currently authenticated person" do
        @client.should_receive(:get_person).with("~", {})
        @client.get_me
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