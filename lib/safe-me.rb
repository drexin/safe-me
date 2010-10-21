$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'safe-me/version'
require 'safe-me/var_args'
require 'safe-me/version'
require 'safe-me/safe_loader'
require 'extensions/module'
require 'extensions/class'
require 'extensions/hash'
require 'extensions/array'


module SafeMe
  module Rails
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        Dir.glob("safe/*_safe.rb").each do |f|
          SafeLoader.instance_eval File.read(f)
        end
      end
    end
  end
end