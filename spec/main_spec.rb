class Hello
  method_name = :foo
  define_method method_name do |*args|
    "#{method_name} world"
  end
end

describe "Konjure" do
  describe "#define_method" do

    it "should correctly implement #foo" do
      Hello.new.foo.should == "foo world"
    end

  end
end
