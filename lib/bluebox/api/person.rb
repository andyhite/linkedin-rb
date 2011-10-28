module Bluebox
  module API
    module Person
      FIELDS = {
        :person => ['id', 'first-name', 'last-name', 'headline', 'location', 'industry', 
          'distance', 'relation-to-viewer', 'current-share', 'connections', 'num-connections', 
          'num-connections-capped', 'summary', 'specialties', 'proposal-comments', 'associations', 
          'honors', 'interests', 'positions', 'publications', 'patents', 'languages', 'skills', 
          'certifications', 'educations', 'three-current-positions', 'three-past-positions', 
          'num-recommenders', 'recommendations-received', 'phone-numbers', 'im-accounts', 
          'twitter-accounts', 'date-of-birth', 'main-address', 'member-url-resources', 'picture-url', 
          'site-standard-profile-request', 'api-public-profile-request', 'public-profile-url'],
        :membership =>['person', 'group', 'membership-state', 'show-group-logo-in-profile', 
          'allow-messages-from-members', 'email-digest-frequency', 'email-announcements-from-managers', 
          'email-for-every-new-post'],
        :suggestion => ['id', 'name', 'short-description', 'description', 'relation-to-viewer', 'posts', 
          'counts-by-category', 'is-open-to-non-members', 'category', 'website-url', 'locale', 
          'location', 'allow-member-invites', 'small-logo-url', 'large-logo-url', 'num-members']  
      }

      def get_me(options={})
        get_person("~", options)
      end
    
      def get_person(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:person])
        get_object("people", id_or_params, fields, options)
      end
    
      def get_person_connections(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:person])
        get_collection("people", id_or_params, "connections", fields, options)
      end
    
      def get_person_memberships(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:membership])
        get_collection("people", id_or_params, "group-memberships", fields, options)      
      end
    
      def get_person_suggestions(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:suggestion])
        get_collection("people", id_or_params, "suggestions/groups", fields, options)
      end
    
      # Batch lookups
      def get_people(ids, options={})
        fields = fields_from_options(options, FIELDS[:person])
        get_objects("people", ids, fields, options)
      end
    end
  end
end