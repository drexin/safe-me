require 'safe-me/type_safer'

module SafeMe
  module SafeLoader
    def self.safe klass, &block
      m = Methods.new klass
      m.instance_eval &block
    end
  
    class Methods
      def initialize klass
        @klass = klass
      end
    
      def for_method name, &block
        @klass.class_eval do
          safe_method(name, TypeSafer.new(&block))
        end
      end
    end
  end
end