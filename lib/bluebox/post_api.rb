module Bluebox
  module PostAPI
    FIELDS = ['id', 'type', 'category', 'creator', 'title', 'summary', 'creation-timestamp', 
      'relation-to-viewer', 'likes', 'comments', 'attachment', 'site-group-post-url']  
    
    def get_post(id_or_params, options={})
      fields = fields_from_options(options, FIELDS)
      get_object("posts", id_or_params, fields, options)
    end
  end
end