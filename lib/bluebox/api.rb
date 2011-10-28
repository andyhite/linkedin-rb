require 'bluebox/person_api'
require 'bluebox/group_api'

module Bluebox
  module API
    include Bluebox::PersonAPI
    include Bluebox::GroupAPI
    
    def get(path, fields, options={})
      options = { :format => 'json' }.merge(options)
      request(:get, "#{base_uri}/#{path}:(#{fields.join(',')})?#{options.to_param}")
    end
    
  private
    def parse_options(options={})
      fields = options.delete(:fields)
      path = options.delete(:path) || options.to_param
      [path, fields]
    end
  end
end