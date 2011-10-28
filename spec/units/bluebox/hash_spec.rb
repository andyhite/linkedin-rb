require_relative '../../spec_helper'

describe Hash do
  describe "#underscore_keys!" do
    before do
      @hash = { 'camelCaseKey' => 'camel_case_key', 'CamelCaseKey2' => 'camel_case_key2' }
    end
    
    it "should transform CamelCase keys to under_score keys" do
      @new_hash = @hash.dup.underscore_keys!
      @hash.each_pair do |key, value|
        @new_hash.should have_key(value)
      end
    end
  end
  
  describe "#recursive_underscore_keys!" do
    before do
      @hash = { 'camelCaseKey' => { 'camelCaseKey2' => 'camel_case_key2' } }
    end
    
    it "should transform CamelCase keys to under_score keys for all levels" do
      @new_hash = @hash.dup.recursive_underscore_keys!
      @hash['camelCaseKey'].each_pair do |key, value|
        @new_hash['camel_case_key'].should have_key(value)
      end
    end
  end
end