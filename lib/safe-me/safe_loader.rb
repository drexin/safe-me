class SafeLoader
  def self.safe klass, method, *types
    klass.class_eval do
      safe_method(method, types)
    end
  end
end