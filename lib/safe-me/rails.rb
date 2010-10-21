module SafeMe
  module Rails
    class Railtie < ::Rails::Railtie
      config.after_initialize do
        SafeMe.init
      end
    end
  end
end