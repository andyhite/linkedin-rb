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
    
    describe "#get_me" do
      it "should request the currently authenticated person" do
        @client.should_receive(:get_person).with("~")
        @client.get_me
      end
    end
    
    describe "#get_person" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("people", "~", Bluebox::PersonAPI::FIELDS, {})
          @client.get_person("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_object).with("people", "~", ['id'], {})
          @client.get_person('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_person_connections" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("people", "~", "connections", Bluebox::PersonAPI::FIELDS, {})
          @client.get_person_connections("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("people", "~", "connections", ['id'], {})
          @client.get_person_connections('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_person_memberships" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("people", "~", "group-memberships", Bluebox::PersonAPI::MEMBERSHIP_FIELDS, {})
          @client.get_person_memberships("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("people", "~", "group-memberships", ['id'], {})
          @client.get_person_memberships('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_person_suggestions" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("people", "~", "suggestions/groups", Bluebox::PersonAPI::SUGGESTION_FIELDS, {})
          @client.get_person_suggestions("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("people", "~", "suggestions/groups", ['id'], {})
          @client.get_person_suggestions('~', :fields => ['id'])
        end
      end
    end
  end
end