require 'safe-me/var_args'

class Array

  class ArrayType
    def initialize type
      @type = type
    end

    def is_type_of? obj
      obj.kind_of? @type
    end

    def to_s
      "Array[#{@type}]"
    end
  end

  alias_method :orig_kind_of?, :kind_of?

  def kind_of? type
    if type.kind_of?(ArrayType) or type.kind_of?(VarArgs)
      self.each do |e|
        return false if not type.is_type_of?(e)
      end
    else
      orig_kind_of? type
    end
  end

  def self.[] type
    ArrayType.new(type)
  end
end