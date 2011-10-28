class Hash
  def underscore_keys!
    keys.each do |key|
      self[(key.underscore rescue key) || key] = delete(key)
    end
    self
  end
  
  def recursive_underscore_keys!
    self.underscore_keys!
    self.values.select { |v| v.is_a?(Hash) }.each { |h| h.recursive_underscore_keys! }
    self
  end
end