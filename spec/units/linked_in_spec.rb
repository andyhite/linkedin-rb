require_relative '../spec_helper'

describe LinkedIn do
  it "has a version" do
    LinkedIn.const_defined?("VERSION").should be_true
  end
  
  describe ".configure" do
    LinkedIn::Configuration::DEFAULT_OPTIONS.each_key do |key|
      it "should set the #{key}" do
        LinkedIn.configure do |config|
          config.send("#{key}=", key)
        end
        LinkedIn.send(key).should == key
      end
    end
  end
  
  describe ".reset" do
    LinkedIn::Configuration::DEFAULT_OPTIONS.each_pair do |key, value|
      it "should set the default #{key}" do
        LinkedIn.configure do |config|
          config.send("#{key}=", value)
        end
        LinkedIn.send(key).should == value
      end
    end
  end
end