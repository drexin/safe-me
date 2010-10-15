require 'spec/classes/foo'

safe Foo do
  for_method :a_method do
    argument 1 do
      quacks_like(Integer)
    end
    argument 2 do
      quacks_like(Integer)
    end
  end
end
