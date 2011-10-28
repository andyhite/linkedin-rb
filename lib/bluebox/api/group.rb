module Bluebox
  module API
    module Group
      def get_group(id_or_params, options={})
        get_object("groups", id_or_params, options)
      end
    
      def get_group_posts(id_or_params, options={})
        get_collection("groups", id_or_params, "posts", options)
      end
    
      # Batch lookups
      def get_groups(ids, options={})
        get_objects("groups", ids, options)
      end
    end
  end
end