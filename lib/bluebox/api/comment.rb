module Bluebox
  module API
    module Comment
      FIELDS = {
        :comment => ['id', 'text', 'creator', 'creation-timestamp', 'relation-to-viewer']
      }  
    
      def get_comment(id_or_params, options={})
        get_object("comments", id_or_params, options)
      end
    
      # Batch lookups
      def get_comments(ids, options={})
        get_objects("comments", ids, options)
      end
    end
  end
end