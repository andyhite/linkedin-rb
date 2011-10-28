require_relative '../../spec_helper'

describe Bluebox::GroupAPI do
  describe "with an initialized client" do
    before do
      @client = Bluebox::Client.new({
        :oauth_token => "oauth-token",
        :oauth_secret => "oauth-secret"
      })
      @access_token = mock('access token')
      @client.stub(:access_token) { @access_token }
    end
    
    describe "#get_group" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_object).with("groups", "~", Bluebox::GroupAPI::FIELDS[:group], {})
          @client.get_group("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_object).with("groups", "~", ['id'], {})
          @client.get_group('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_group_posts" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_collection).with("groups", "~", "posts", Bluebox::GroupAPI::FIELDS[:post], {})
          @client.get_group_posts("~")
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_collection).with("groups", "~", "posts", ['id'], {})
          @client.get_group_posts('~', :fields => ['id'])
        end
      end
    end
    
    describe "#get_groups" do
      context "without explicit fields" do
        it "should request all the fields" do
          @client.should_receive(:get_objects).with("groups", ['1', '2', '3'], Bluebox::GroupAPI::FIELDS[:group], {})
          @client.get_groups(['1', '2', '3'])
        end
      end
      
      context "with explicit fields" do
        it "should request only the requested fields" do
          @client.should_receive(:get_objects).with("groups", ['1', '2', '3'], ['id'], {})
          @client.get_groups(['1', '2', '3'], :fields => ['id'])
        end
      end
    end
  end
end