module Bluebox
  module API
    module Company
      FIELDS = {
        :company => ['id', 'name', 'universal-name', 'email-domains', 'company-type', 'ticker', 
          'website-url', 'industry', 'status', 'logo-url', 'square-logo-url', 'blog-rss-url', 
          'twitter-id', 'employee-count-range', 'specialties', 'locations', 'description', 
          'stock-exchange', 'founded-year', 'end-year', 'num-followers']
      }
    
      def get_company(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:company])
        get_object("companies", id_or_params, fields, options)
      end
    
      # Batch lookups
      def get_companies(ids, options={})
        fields = fields_from_options(options, FIELDS[:company])
        get_objects("companies", ids, fields, options)
      end
    end
  end
end