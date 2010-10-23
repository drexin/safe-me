Class.class_eval do
  def type_of? obj
    obj.kind_of? self
  end
end