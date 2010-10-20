module SafeMe
  unless defined?(SafeMe::VERSION)
    VERSION       = '0.0.1'
    LIBDIR        = File.expand_path(File.dirname(__FILE__) + '/../../lib')
  end
end