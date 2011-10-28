module Bluebox
  module PersonAPI
    FIELDS = ['id', 'first-name', 'last-name', 'headline', 'location', 'industry', 
      'distance', 'relation-to-viewer', 'current-share', 'connections', 'num-connections', 
      'num-connections-capped', 'summary', 'specialties', 'proposal-comments', 'associations', 
      'honors', 'interests', 'positions', 'publications', 'patents', 'languages', 'skills', 
      'certifications', 'educations', 'three-current-positions', 'three-past-positions', 
      'num-recommenders', 'recommendations-received', 'phone-numbers', 'im-accounts', 
      'twitter-accounts', 'date-of-birth', 'main-address', 'member-url-resources', 'picture-url', 
      'site-standard-profile-request', 'api-public-profile-request', 'public-profile-url']
      
    GROUP_FIELDS = ['group', 'membership-state', 'show-group-logo-in-profile', 'allow-messages-from-members', 
      'email-digest-frequency', 'email-announcements-from-managers', 'email-for-every-new-post']
    
    def get_person(options={})
      path, fields = parse_options(options)
      get("people/#{path}", fields || Bluebox::PersonAPI::FIELDS)
    end
    
    def get_person_groups(options={})
      path, fields = parse_options(options)
      get("people/#{path}/group-memberships", fields || Bluebox::PersonAPI::GROUP_FIELDS)
    end
  end
end