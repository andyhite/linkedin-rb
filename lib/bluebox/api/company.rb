module Bluebox
  module API
    module Company
      FIELDS = {
        :company => ['id', 'name', 'universal-name', 'email-domains', 'company-type', 'ticker', 
          'website-url', 'industry', 'status', 'logo-url', 'square-logo-url', 'blog-rss-url', 
          'twitter-id', 'employee-count-range', 'specialties', 'locations', 'description', 
          'stock-exchange', 'founded-year', 'end-year', 'num-followers'],
        :product => ['id', 'name', 'type', 'creation-timestamp', 'logo-url', 'description', 
          'features', 'video', 'product-deal', 'sales-persons', 'num-recommendations', 
          'recommendations', 'product-category', 'website-url', 'disclaimer'],
        :search => ['companies']
      }
      
      def search_companies(keywords, options={})
        fields = fields_from_options(options, FIELDS[:search])
        options = { :keywords => keywords }.merge(options)
        get("company-search", fields, options)
      end
    
      def get_company(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:company])
        get_object("companies", id_or_params, fields, options)
      end
      
      def get_company_products(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:product])
        get_collection("companies", id_or_params, "products", fields, options)
      end
    
      # Batch lookups
      def get_companies(ids, options={})
        fields = fields_from_options(options, FIELDS[:company])
        get_objects("companies", ids, fields, options)
      end
    end
  end
end