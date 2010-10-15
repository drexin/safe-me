require 'duck_type'

module TypeWrapper
  def self.create &block
    instance_eval &block
  end
  
  def self.quacks_like type
    DuckType.new type
  end
end