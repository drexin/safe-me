spec = Gem::Specification.new do |s|
  s.name = 'safe-me'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.extra_rdoc_files = ['LICENSE', 'README.rdoc']
  s.summary = '#{s.name}-#{s.version}'
  s.description = 'Add typechecking whenever you need it, without messing up your class files.'
  s.author = 'Dario Rexin'
  s.email = 'dario.rexin@r3-tech.de'
  
  s.add_development_dependency "rspec"
  
  s.files = %w(LICENSE Rakefile) + Dir.glob("{lib,spec}/**/*")
  s.require_path = "lib"
end