require 'bluebox/api/person'
require 'bluebox/api/group'
require 'bluebox/api/post'
require 'bluebox/api/comment'
require 'bluebox/api/company'

module Bluebox
  module API
    include Bluebox::API::Person
    include Bluebox::API::Group
    include Bluebox::API::Post
    include Bluebox::API::Comment
    include Bluebox::API::Company
    
    def get(path, fields, options={})
      options = { :format => 'json' }.merge(options)
      request(:get, "#{base_uri}/#{path}:(#{fields.join(',')})?#{options.to_param}")
    end
    
    def get_object(object, id_or_param, fields=[], options={})
      query = parse_query(id_or_param)
      get("#{object}/#{query}", fields, options)
    end
    
    def get_objects(object, ids, fields=[], options={})
      get("#{object}::(#{ids.join(',')})", fields, options)['values']
    end
    
    def get_collection(object, id_or_param, collection, fields=[], options={})
      query = parse_query(id_or_param)
      get("#{object}/#{query}/#{collection}", fields, options)['values']
    end
    
  private
    def parse_query(id_or_param)
      id_or_param.is_a?(Hash) ? id_or_param.to_param : id_or_param
    end
    
    def fields_from_options(options, defaults)
      options.delete(:fields) || defaults
    end
  end
end