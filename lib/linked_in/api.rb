require 'linked_in/api/person'
require 'linked_in/api/group'
require 'linked_in/api/post'
require 'linked_in/api/comment'
require 'linked_in/api/company'

module LinkedIn
  module API
    include LinkedIn::API::Person
    include LinkedIn::API::Group
    include LinkedIn::API::Post
    include LinkedIn::API::Comment
    include LinkedIn::API::Company
    
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
      get("#{object}::(#{ids.join(',')})", options)
    end
    
    def get_collection(object, id_or_param, collection, options={})
      query = parse_query(id_or_param)
      get("#{object}/#{query}/#{collection}", options)
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