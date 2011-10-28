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
    
    def get(path, options={})
      options = { :format => 'json', :fields => nil }.merge(options)
      fields = options.delete(:fields)
      request(:get, "#{base_uri}/#{build_request(path, fields, options)}")
    end
    
    def get_object(object, id_or_param, options={})
      query = parse_query(id_or_param)
      get("#{object}/#{query}", options)
    end
    
    def get_objects(object, ids, options={})
      get("#{object}::(#{ids.join(',')})", options)['values']
    end
    
    def get_collection(object, id_or_param, collection, options={})
      query = parse_query(id_or_param)
      get("#{object}/#{query}/#{collection}", options)['values']
    end
    
  private
    def parse_query(id_or_param)
      id_or_param.is_a?(Hash) ? id_or_param.to_param : id_or_param
    end
    
    def fields_from_options(options)
      options.delete(:fields) || nil
    end
    
    def build_request(path, fields, options)
      request = ""
      request << "#{path}"
      request << ":(#{fields.join(',')})" unless fields.blank?
      request << "?#{options.to_param}" unless options.blank?
      request
    end
  end
end