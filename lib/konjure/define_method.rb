module Module

  # Overwrite the existing useless implementation
  def define_method(name, &block)
    objc_define_method(name, :object, Konjure::objc_parameter_types(block), &block)
  end

  def objc_define_method(name, return_type = :object, *parameter_types, &block)
    raise ArgumentError, 'Block required' if block.nil?

    signature = Konjure::objc_signature(return_type, parameter_types)
    implementation = Konjure::method_implementation(block)
    implementation.retain # prevent RubyMotion from collecting the proc
    class_replaceMethod(self, name.to_sym, implementation, signature.UTF8String)
    implementation
  end

end

module Konjure

  def self.objc_signature(*types)
    return_type, *parameter_types = types.flatten.map { |type|
      TYPE_SHORTCUTS[type] || type
    }
    return_type ||= '@'
    parameter_types = parameter_types.join('')

    "#{return_type}@:#{parameter_types}"
  end

  def self.objc_parameter_types(block)
    [:object] * block.arity.abs
  end

  def self.method_implementation(block)
    case block.arity
    when 0
      lambda { |_self, cmd| _self.instance_exec(&block) }
    when 1
      lambda { |_self, cmd, a| _self.instance_exec(a, &block) }
    when -1
      lambda { |_self, cmd, *a| _self.instance_exec(*a, &block) }
    when 2
      lambda { |_self, cmd, a,b| _self.instance_exec(a,b, &block) }
    when -2
      lambda { |_self, cmd, a,*b| _self.instance_exec(a,*b, &block) }
    when 3
      lambda { |_self, cmd, a,b,c| _self.instance_exec(a,b,c, &block) }
    when -3
      lambda { |_self, cmd, a,b,*c| _self.instance_exec(a,b,*c, &block) }
    when 4
      lambda { |_self, cmd, a,b,c,d| _self.instance_exec(a,b,c,d, &block) }
    when -4
      lambda { |_self, cmd, a,b,c,*d| _self.instance_exec(a,b,c,*d, &block) }
    when 5
      lambda { |_self, cmd, a,b,c,d,e| _self.instance_exec(a,b,c,d,e, &block) }
    when -5
      lambda { |_self, cmd, a,b,c,d,*e| _self.instance_exec(a,b,c,d,*e, &block) }
    when 6
      lambda { |_self, cmd, a,b,c,d,e,f| _self.instance_exec(a,b,c,d,e,f, &block) }
    when -6
      lambda { |_self, cmd, a,b,c,d,e,*f| _self.instance_exec(a,b,c,d,e,*f, &block) }
    else
      raise ArgumentError, 'define_method is limited to methods with 0..6 parameters'
    end
  end

  TYPE_SHORTCUTS = {
    bool:       'B',
    boolean:    'B',
    char:       'c',
    class:      '#',
    double:     'd',
    float:      'f',
    id:         '@',
    int:        'i',
    long:       'l',
    long_long:  'q',
    object:     '@',
    pointer:    '^',
    sel:        ':',
    selector:   ':',
    short:      's',
    string:     '*',
    uchar:      'C',
    uint:       'I',
    ulong:      'L',
    ulong_long: 'Q',
    ushort:     'S',
  }

end
