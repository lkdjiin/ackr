# -*- encoding: utf-8 -*-

require './spec/helper'

describe "String#to_regexp" do
 
  context "fail cases" do
    specify { "reg".to_regexp.should be_nil }
    specify { "/reg".to_regexp.should be_nil }
    specify { "reg/".to_regexp.should be_nil }
    specify { "reg/i".to_regexp.should be_nil }
    specify { "/reg/mk".to_regexp.should be_nil }
  end

  context "pass cases" do
    specify { "/reg/".to_regexp.should == /reg/ }
    specify { "/reg/i".to_regexp.should == /reg/i }
    specify { "/reg/m".to_regexp.should == /reg/m }
    specify { "/reg/x".to_regexp.should == /reg/x }
    specify { "/reg/im".to_regexp.should == /reg/im }
    specify { "/reg/ix".to_regexp.should == /reg/ix }
    specify { "/reg/imx".to_regexp.should == /reg/imx }
    specify { "  /reg/i ".to_regexp.should == /reg/i }
    specify { "   /reg/    ".to_regexp.should == /reg/ }
  end
end
