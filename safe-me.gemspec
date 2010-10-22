$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'lib/safe-me/version'

spec = Gem::Specification.new do |s|
  s.name = 'safe-me'
  s.homepage = 'http://github.com/drexin/safe-me'
  s.version = SafeMe::VERSION
  s.has_rdoc = true
  s.extra_rdoc_files = ['LICENSE', 'README.rdoc']
  s.summary = '#{s.name}-#{s.version}'
  s.description = 'Add typechecking whenever you need it, without messing up your class files.'
  s.author = 'Dario Rexin'
  s.email = 'dario.rexin@r3-tech.de'
  
  s.add_development_dependency "rspec"
  
  s.files = %w(LICENSE Rakefile) + Dir.glob("{lib,spec,safe}/**/*")
  s.require_path = 'lib'
end