require 'json'
require_relative '../../spec_helper'

describe Bluebox::Response do
  describe "an initialized request" do
    before do
      @code = 200
      @body = {"keyOne" => "value"}.to_json
      raw_response = mock('raw response')
      raw_response.stub(:code) { @code }
      raw_response.stub(:body) { @body }
      @response = Bluebox::Response.new(raw_response)
    end
    
    it "should set the code" do
      @response.code.should == @code
    end
    
    it "should set the body" do
      @response.body.should == @body
    end
    
    context "#parsed_body" do      
      it "should return the body as a hash" do
        @response.parsed_body.should == {"key_one" => "value"}
      end
      
      it "should underscore the keys of the returned hash" do
        @response.parsed_body.should have_key("key_one")
      end
    end
    
    context "#[]" do
      it "should return the value for a key in #parsed_body" do
        @response['key_one'].should == 'value'
      end
    end
  end
end