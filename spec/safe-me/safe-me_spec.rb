require 'spec/classes/foo'
require 'safe-me'


describe SafeMe do
  describe "a class with a safe-me description file" do
    describe "a method with quacks_like arguments" do
      it "should only allow arguments, that has the same methods as the specified types" do
        lambda{Foo.new.a_method 3, 4}.should_not raise_error(ArgumentError)
        lambda{Foo.new.a_method "3", 4}.should raise_error(ArgumentError, "for argument 1 expected type QuacksLike(Integer)")
      end
    end
    
    describe "a method with a nilable(Type) argument" do
      it "should allow this type, or nil" do
        lambda{Foo.new.another_method 3}.should_not raise_error(ArgumentError)
        lambda{Foo.new.another_method nil}.should_not raise_error(ArgumentError)
        lambda{Foo.new.another_method "foo"}.should raise_error(ArgumentError, "for argument 1 expected type Nilable(Integer)")
      end
    end
    
    describe "a method with an argument of a specified type" do
      it "should only allow arguments of that type" do
        lambda{Foo.new.give_string "a string"}.should_not raise_error(ArgumentError)
        lambda{Foo.new.give_string nil}.should raise_error(ArgumentError, "for argument 1 expected type String")
        lambda{Foo.new.give_string 1}.should raise_error(ArgumentError, "for argument 1 expected type String")
      end
    end
  end
end