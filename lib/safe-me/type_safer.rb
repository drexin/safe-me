require 'type_wrapper'

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
      raise ArgumentError.new("for argument #{i+1} expected type #{@types[i]}") unless  @types[i].equals?(tmp[i].class)
    end
  end
  
  def argument i, &block
    @types[i-1] = TypeWrapper.create(&block)
  end
end