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
      @response.body.should == @body.from_json
    end
    
    context "#[]" do
      it "should return the value for a key in #parsed_body" do
        @response['keyOne'].should == 'value'
      end
    end
  end
end