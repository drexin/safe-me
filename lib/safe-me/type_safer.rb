require 'duck_type'
require 'nilable_type'

class TypeSafer
  
  def initialize &block
    @types = []
    instance_eval &block
  end
    
  def check *args
    tmp = args
    if @types.last.kind_of?(VarArgs)
      tmp = args.slice(0, @types.size-1) + [args.slice(@types.size-1,args.size)]
    end
    tmp.size.times do |i|
      raise ArgumentError.new("for argument #{i+1} expected type #{@types[i]}") unless  @types[i].type_of?(tmp[i])
    end
  end
  
  def argument i, type
    @types[i-1] = type
  end

  def quacks_like type
    DuckType.new type
  end
  
  def nilable type
    NilableType.new type
  end
  
  private :quacks_like, :argument
end