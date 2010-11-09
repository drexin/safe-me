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
  
  for_method :unchecked_method do
    argument Integer
    argument unchecked
  end
  
  for_method :test_arguments do
    arguments Integer, Integer, String, nilable(Array.ofType(String))
  end
end
