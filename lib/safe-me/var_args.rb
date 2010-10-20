
class VarArgs

  def is_type_of? obj
    obj.kind_of? @type
  end

  def self.[] type
    self.new(type)
  end

  def to_s
    "VarArgs[#{@type}]"
  end

  private
  def initialize type
    @type = type
  end
end