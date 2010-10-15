$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'type_safer'

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