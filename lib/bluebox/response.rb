module Bluebox
  class Response
    attr_accessor :code, :body
    
    def initialize(response)
      @code = response.code
      @body = response.body.from_json
    end
    
    def [](attribute)
      body[attribute]
    end
  end
end