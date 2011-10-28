require 'bluebox/hash'

module Bluebox
  class Response
    attr_accessor :code, :body
    
    def initialize(response)
      @code = response.code
      @body = response.body
    end
    
    def parsed_body
      @parsed_body ||= JSON.parse(body).underscore_keys!
    end
    
    def [](attribute)
      parsed_body[attribute]
    end
  end
end