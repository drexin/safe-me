class NilableType
  def initialize type
    @type = type
  end
  
  def type_of? obj
    obj.nil? or obj.kind_of?(@type)
  end
  
  def to_s
    "Nilable(#{@type})"
  end
end