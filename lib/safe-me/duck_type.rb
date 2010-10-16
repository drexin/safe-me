class DuckType
  def initialize type
    @type = type
  end
  
  def type_of? obj
    @type.public_instance_methods.each do |m|
      return false unless obj.class.public_instance_methods.include? m
    end
    true
  end
  
  def to_s
    "QuacksLike(#{@type})"
  end
end