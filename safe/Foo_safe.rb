require 'spec/classes/foo'

safe Foo do
  for_method :a_method do
    argument 1, quacks_like(Integer)
    argument 2, quacks_like(Integer)
  end
  
  for_method :another_method do
    argument 1, nilable(Integer)
  end
  
  for_method :give_string do
    argument 1, String
  end
end
