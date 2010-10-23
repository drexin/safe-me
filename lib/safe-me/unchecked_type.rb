require 'singleton'

module SafeMe
  class UncheckedType
    include Singleton
    
    def type_of? obj
      true
    end

    def to_s
      "unchecked"
    end
  end
end