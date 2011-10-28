module Bluebox
  module CommentAPI
    FIELDS = {
      :comment => ['id', 'text', 'creator', 'creation-timestamp', 'relation-to-viewer']
    }  
    
    def get_comment(id_or_params, options={})
      fields = fields_from_options(options, FIELDS[:comment])
      get_object("comments", id_or_params, fields, options)
    end
  end
end