require 'safe-me'

describe Array do
  describe "an array filled with integers" do
    it "should be kind_of? Array.ofType(Integer)" do
      [1,2,3].kind_of?(Array.ofType(Integer)).should be_true
    end
  end
  
  describe "an array filled with string" do
    it "should not be kind_of? Array.ofType(Integer)" do
      ["a", "b", "c"].kind_of?(Array.ofType(Integer)).should be_false
    end
  end
  
  describe "an array filled with objects of different types" do
    it "should not be kind_of? Array.ofType(Integer)" do
      [1,2,"a"].kind_of?(Array.ofType(Integer)).should be_false
    end
  end
end