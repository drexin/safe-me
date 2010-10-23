class Foo
  def a_method a, b
    "#{a} and #{b} should both be integers."
  end
  
  def another_method a
    "#{a} should be an integer or nil."
  end
  
  def give_string s
    "#{s} should be a string"
  end
  
  def baz a
    "#{a} should respond to :bar"
  end
  
  def unchecked_method a,b
    "#{b} should be unchecked"
  end
end