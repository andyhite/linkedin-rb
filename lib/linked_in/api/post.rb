module LinkedIn
  module API
    module Post
      def get_post(id_or_params, options={})
        get_object("posts", id_or_params, options)
      end
    
      # Batch lookups
      def get_posts(ids, options={})
        get_objects("posts", ids, options)
      end
    end
  end
end