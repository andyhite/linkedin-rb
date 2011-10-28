module Bluebox
  module GroupAPI
    FIELDS = {
      :group => ['id', 'name', 'short-description', 'description', 'relation-to-viewer', 'posts', 
        'counts-by-category', 'is-open-to-non-members', 'category', 'website-url', 'locale', 
        'location', 'allow-member-invites', 'small-logo-url', 'large-logo-url', 'num-members'],
      :post => ['id', 'type', 'category', 'creator', 'title', 'summary', 'creation-timestamp', 
        'relation-to-viewer', 'likes', 'comments', 'attachment', 'site-group-post-url']
    }
    
    def get_group(id_or_params, options={})
      fields = fields_from_options(options, FIELDS[:group])
      get_object("groups", id_or_params, fields, options)
    end
    
    def get_group_posts(id_or_params, options={})
      fields = fields_from_options(options, FIELDS[:post])
      get_collection("groups", id_or_params, "posts", fields, options)
    end
    
    # Batch lookups
    def get_groups(ids, options={})
      fields = fields_from_options(options, FIELDS[:group])
      get_objects("groups", ids, fields, options)
    end
  end
end