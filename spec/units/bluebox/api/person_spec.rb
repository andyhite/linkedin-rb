require_relative '../../../spec_helper'

describe Bluebox::API::Person do
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
        @client.should_receive(:get_person).with("~", {})
        @client.get_me
      end
    end
    
    describe "#get_person" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("people", "~", Bluebox::API::Person::FIELDS[:person], {})
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
          @client.should_receive(:get_collection).with("people", "~", "connections", Bluebox::API::Person::FIELDS[:person], {})
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
          @client.should_receive(:get_collection).with("people", "~", "group-memberships", Bluebox::API::Person::FIELDS[:membership], {})
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
          @client.should_receive(:get_collection).with("people", "~", "suggestions/groups", Bluebox::API::Person::FIELDS[:suggestion], {})
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
    
    describe "#get_person_followed_companies" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("people", "~", "following/companies", Bluebox::API::Person::FIELDS[:company], {})
          @client.get_person_followed_companies("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("people", "~", "following/companies", ['id'], {})
          @client.get_person_followed_companies('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_person_suggested_companies" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("people", "~", "suggestions/to-follow/companies", Bluebox::API::Person::FIELDS[:company], {})
          @client.get_person_suggested_companies("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("people", "~", "suggestions/to-follow/companies", ['id'], {})
          @client.get_person_suggested_companies('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_people" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_objects).with("people", ['1', '2', '3'], Bluebox::API::Person::FIELDS[:person], {})
          @client.get_people(['1', '2', '3'])
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_objects).with("people", ['1', '2', '3'], ['id'], {})
          @client.get_people(['1', '2', '3'], :fields => ['id'])
        end
      end
    end
  end
end