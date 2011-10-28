require 'bluebox/response'

module Bluebox
  module Request    
    def request(method, uri)
      Bluebox::Response.new(access_token.send(method, uri))
    end
  end
end