require 'linked_in/request'
require 'linked_in/api'

module LinkedIn
  class Client
    include LinkedIn::Request
    include LinkedIn::API
    
    attr_accessor :oauth_token, :oauth_secret
    
    def initialize(oauth_token, oauth_secret)
      @oauth_token = oauth_token
      @oauth_secret = oauth_secret
      
      raise StandardError, "Configuration: consumer_key is required" if consumer_key.blank?
      raise StandardError, "Configuration: consumer_secret is required" if consumer_secret.blank?
      raise StandardError, "Configuration: base_uri is required" if base_uri.blank?
    end
    
    def consumer
      ::OAuth::Consumer.new(consumer_key, consumer_secret)
    end
    
    def access_token
      ::OAuth::AccessToken.new(consumer, oauth_token, oauth_secret)
    end
    
  private
    
    def consumer_key
      @consumer_key ||= LinkedIn.consumer_key
    end
    
    def consumer_secret
      @consumer_secret ||= LinkedIn.consumer_secret
    end
    
    def base_uri
      @base_uri ||= LinkedIn.base_uri
    end
  end
end