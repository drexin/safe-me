require 'extensions/module'

Hash.class_eval do
  class HashType
    def initialize key_type, value_type
      @key_type = key_type
      @value_type = value_type
    end

    def is_type_of? k, v
      k.kind_of?(@key_type) and v.kind_of?(@value_type)
    end

    def to_s
      "Hash[#{@key_type}, #{@value_type}]"
    end
  end

  alias_method :orig_kind_of?, :kind_of?

  def kind_of? type
    if type.kind_of? HashType
      self.each do |k,v|
        return false if not type.is_type_of?(k, v)
      end
    else
      orig_kind_of? type
    end
  end

  def self.ofType key_type, value_type
    HashType.new key_type, value_type
  end
end
