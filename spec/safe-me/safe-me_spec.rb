require 'spec/classes/foo'
require 'safe-me'


describe SafeMe do
  describe "a class with a safe-me description file" do
    describe "a method with typesafe arguments" do
      it "should only allow the specified types" do
        lambda{Foo.new.a_method 3, 4}.should_not raise_error(ArgumentError)
        lambda{Foo.new.a_method "3", 4}.should raise_error(ArgumentError, "for argument 1 expected type QuacksLike(Integer)")
      end
    end
  end
end