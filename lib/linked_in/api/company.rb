module LinkedIn
  module API
    module Company
      def search_companies(keywords, options={})
        options = { :keywords => keywords }.merge(options)
        get("company-search", options)
      end
    
      def get_company(id_or_params, options={})
        get_object("companies", id_or_params, options)
      end
      
      def get_company_products(id_or_params, options={})
        get_collection("companies", id_or_params, "products", options)
      end
    
      # Batch lookups
      def get_companies(ids, options={})
        get_objects("companies", ids, options)
      end
    end
  end
end