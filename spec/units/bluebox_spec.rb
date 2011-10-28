require_relative '../spec_helper'

describe Bluebox do
  it "has a version" do
    Bluebox.const_defined?("VERSION").should be_true
  end
  
  describe ".configure" do
    Bluebox::Configuration::DEFAULT_OPTIONS.each_key do |key|
      it "should set the #{key}" do
        Bluebox.configure do |config|
          config.send("#{key}=", key)
        end
        Bluebox.send(key).should == key
      end
    end
  end
  
  describe ".reset" do
    Bluebox::Configuration::DEFAULT_OPTIONS.each_pair do |key, value|
      it "should set the default #{key}" do
        Bluebox.configure do |config|
          config.send("#{key}=", value)
        end
        Bluebox.send(key).should == value
      end
    end
  end
end