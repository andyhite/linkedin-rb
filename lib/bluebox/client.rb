module Bluebox
  class Client
    attr_accessor :oauth_token, :oauth_secret
    
    def initialize(options={})
      @oauth_token = options[:oauth_token]
      @oauth_secret = options[:oauth_secret]
    end
    
    def consumer
      OAuth::Consumer.new(consumer_key, consumer_secret)
    end
    
    def access_token
      OAuth::AccessToken.new(consumer, oauth_token, oauth_secret)
    end
    
    def get(path)
      access_token.get("#{base_uri}/#{path}")
    end
    
  private
    def consumer_key
      Bluebox.consumer_key
    end
    
    def consumer_secret
      Bluebox.consumer_secret
    end
    
    def base_uri
      Bluebox.base_uri
    end
  end
end