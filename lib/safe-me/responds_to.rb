module SafeMe
  class RespondsTo
    def initialize *methods
      @methods = methods
    end
  
    def type_of? obj
      @methods.each do |m|
        return false unless obj.respond_to? m
      end
      true
    end
  
    def to_s
      "RespondsTo(#{@methods.join(', ')})"
    end
  end
end