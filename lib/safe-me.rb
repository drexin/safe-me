$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'safe-me/safe_loader'
require 'safe-me/hash'
require 'safe-me/array'
require 'safe-me/var_args'

module SafeMe
  attr_accessor :method_types
  def safe_method(name, safer)
    alias_method "__typeunsafe_#{name}__", name
    module_eval do
      method_types = {} if method_types.nil?
      method_types[name] = safer
      define_method name do |*args, &block|
        method_types[name].check(*args)
        send(:"__typeunsafe_#{name}__",*args,&block)
      end
      alias_method "__typesafe_#{name}__", name
    end
  end

  private :safe_method
end

class Module
  include SafeMe
end

Dir.glob("safe/*_safe.rb").each do |f|
  SafeLoader.instance_eval File.read(f)
end
