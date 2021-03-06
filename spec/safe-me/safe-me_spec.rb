require File.join(File.expand_path(File.dirname(__FILE__)), '../classes/foo')
require 'safe-me'

SafeMe.init

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
        lambda{Foo.new.another_method "foo"}.should raise_error(ArgumentError, "for argument 1 expected type Integer or nil")
      end
    end
    
    describe "a method with an argument of a specified type" do
      it "should only allow arguments of that type" do
        lambda{Foo.new.give_string "a string"}.should_not raise_error(ArgumentError)
        lambda{Foo.new.give_string nil}.should raise_error(ArgumentError, "for argument 1 expected type String")
        lambda{Foo.new.give_string 1}.should raise_error(ArgumentError, "for argument 1 expected type String")
      end
    end
    
    describe "a method with an argument that should respond to a method" do
      it "should only allow arguments that respond to this method" do
        b = Struct.new("Bar", :bar)
        lambda{Foo.new.baz b.new}.should_not raise_error(ArgumentError)
        lambda{Foo.new.baz 1}.should raise_error(ArgumentError, "for argument 1 expected type RespondsTo(bar)")
      end
    end
    
    describe "a method with an argument that should be unchecked" do
      it "should allow arguments of any type for that argument" do
        lambda{Foo.new.unchecked_method 1, "a"}.should_not raise_error(ArgumentError)
        lambda{Foo.new.unchecked_method 1, 1}.should_not raise_error(ArgumentError)
        lambda{Foo.new.unchecked_method 1, nil}.should_not raise_error(ArgumentError)
        lambda{Foo.new.unchecked_method 1, [1,2,3,"a"]}.should_not raise_error(ArgumentError)
      end
    end
    
    describe "adding typechecking to a method with only one call of arguments for several args" do
      it "should only allow those types as args" do
        lambda{Foo.new.test_arguments 1, 2, "foo", nil}.should_not raise_error(ArgumentError)
        lambda{Foo.new.test_arguments "1", "2", 1, [1,2,3]}.should raise_error(ArgumentError)
      end
    end
      
  end
end