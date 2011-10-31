module LinkedIn
  module API
    module Person
      
      # Self methods
      def get_me(options={})
        get_person("~", options)
      end
      
      def get_my_connections(options={})
        get_person_connections("~", options)
      end
      
      def get_my_memberships(options={})
        get_person_memberships("~", options)
      end
      
      def get_my_suggestions(options={})
        get_person_suggestions("~", options)
      end
      
      def get_my_followed_companies(options={})
        get_person_followed_companies("~", options)
      end
      
      def get_my_suggested_companies(options={})
        get_person_suggested_companies("~", options)
      end
    
      # Person methods
      def get_person(id_or_params, options={})
        get_object("people", id_or_params, options)
      end
    
      def get_person_connections(id_or_params, options={})
        get_collection("people", id_or_params, "connections", options)
      end
    
      def get_person_memberships(id_or_params, options={})
        get_collection("people", id_or_params, "group-memberships", options)      
      end
    
      def get_person_suggestions(id_or_params, options={})
        get_collection("people", id_or_params, "suggestions/groups", options)
      end
      
      def get_person_followed_companies(id_or_params, options={})
        get_collection("people", id_or_params, "following/companies", options)
      end
      
      def get_person_suggested_companies(id_or_params, options={})
        get_collection("people", id_or_params, "suggestions/to-follow/companies", options)
      end
    
      # Batch lookups
      def get_people(ids, options={})
        get_objects("people", ids, options)
      end
    end
  end
end