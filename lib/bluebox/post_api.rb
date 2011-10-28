module Bluebox
  module PostAPI
    FIELDS = {
      :post => ['id', 'type', 'category', 'creator', 'title', 'summary', 'creation-timestamp', 
        'relation-to-viewer', 'likes', 'comments', 'attachment', 'site-group-post-url']  
    }
    
    def get_post(id_or_params, options={})
      fields = fields_from_options(options, FIELDS[:post])
      get_object("posts", id_or_params, fields, options)
    end
  end
end