module SafeMe
  unless defined?(SafeMe::VERSION)
    VERSION       = '0.9.0'
    LIBDIR        = File.expand_path(File.dirname(__FILE__) + '/../../lib')
  end
end