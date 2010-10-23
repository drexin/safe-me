require File.expand_path(File.dirname(__FILE__)) + '/spec/classes/foo'


safe Foo do
  for_method :a_method do
    argument quacks_like(Integer)
    argument quacks_like(Integer)
  end
  
  for_method :another_method do
    argument nilable(Integer)
  end
  
  for_method :give_string do
    argument String
  end
  
  for_method :baz do
    argument responds_to :bar
  end
end
