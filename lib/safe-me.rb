$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'safe-me/safe_loader'
require 'safe-me/hash'
require 'safe-me/array'
require 'safe-me/var_args'

module SafeMe
  attr_accessor :method_types
  def safe_method(name, types = [])
    alias_method "__typeunsafe_#{name}__", name
    module_eval do
      method_types = {} if method_types.nil?
      method_types[name] = types
      define_method name do |*args, &block|
        tmp = args
        if method_types[name].last.kind_of?(VarArgs)
          tmp = args.slice(0, method_types[name].size-1) + [args.slice(method_types[name].size-1,args.size)]
        end
        tmp.size.times do |i|
          raise ArgumentError.new("for argument #{i+1} expected type #{method_types[name][i]}") if not tmp[i].kind_of?(method_types[name][i])
        end
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
