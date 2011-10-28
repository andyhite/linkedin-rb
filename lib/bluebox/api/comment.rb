module Bluebox
  module API
    module Comment
      FIELDS = {
        :comment => ['id', 'text', 'creator', 'creation-timestamp', 'relation-to-viewer']
      }  
    
      def get_comment(id_or_params, options={})
        fields = fields_from_options(options, FIELDS[:comment])
        get_object("comments", id_or_params, fields, options)
      end
    
      # Batch lookups
      def get_comments(ids, options={})
        fields = fields_from_options(options, FIELDS[:comment])
        get_objects("comments", ids, fields, options)
      end
    end
  end
end