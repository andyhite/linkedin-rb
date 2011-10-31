require 'linked_in/response'

module LinkedIn
  module Request    
    def request(method, uri)
      LinkedIn::Response.new(access_token.send(method, uri))
    end
  end
end