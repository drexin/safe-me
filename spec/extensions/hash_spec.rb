require 'safe-me'

describe Hash do
  describe "a hash filled with keys of String and objects of type Integer" do
    it "should be kind_of? Hash.ofType(String, Integer)" do
      {"a" => 1, "b" => 2, "c" => 3}.kind_of?(Hash.ofType(String, Integer)).should be_true
    end
  end
  
  describe "a hash filled with keys of String and objects of type String" do
    it "should not be kind_of? Hash.ofType(String, Integer)" do
      {"a" => "1", "b" => "2", "c" => "3"}.kind_of?(Hash.ofType(String, Integer)).should be_false
    end
  end
  
  describe "a hash filled with keys and objects of different types" do
    it "should not be kind_of? Hash.ofType(String, Integer)" do
      {"a" => 1, "b" => 2, 3 => "3"}.kind_of?(Hash.ofType(String, Integer)).should be_false
    end
  end
end