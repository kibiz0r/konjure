module Konjure
  def self.generated_trampolines
    @generated_trampolines ||= []
  end
end

module Module
  def define_method(name, &block)
    if block.arity > 0 && !name.end_with?(':')
      name += ':'
    end

    # @ Object return value
    # @ Objective-C self
    # : Objective-C SEL
    # @ Ruby self (_self here)
    # ... Ruby args
    sig = '@@:'
    # I'm not sure why, but the sig shouldn't specify the @ for _self for 0-arg methods even though _self still gets passed in
    sig += '@' * block.arity if block.arity > 0
    sig = sig.UTF8String

    case block.arity
    when 0
      lambda { |_self|              _self.instance_exec &block              }
    when 1
      lambda { |_self, a|           _self.instance_exec a, &block           }
    when 2
      lambda { |_self, a, b|        _self.instance_exec a, b, &block        }
    when 3
      lambda { |_self, a, b, c|     _self.instance_exec a, b, c, &block     }
    when 4
      lambda { |_self, a, b, c, d|  _self.instance_exec a, b, c, d, &block  }
    else
      raise 'hell'
    end.tap do |trampoline|
      Konjure.generated_trampolines << trampoline # retain a reference

      case block.arity
      when 0
        konjure_replaceMethod0 self, name, trampoline, sig
      when 1
        konjure_replaceMethod1 self, name, trampoline, sig
      when 2
        konjure_replaceMethod2 self, name, trampoline, sig
      when 3
        konjure_replaceMethod3 self, name, trampoline, sig
      when 4
        konjure_replaceMethod4 self, name, trampoline, sig
      else
        raise 'hell'
      end
    end
  end
end

