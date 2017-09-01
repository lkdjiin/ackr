# -*- encoding: utf-8 -*-

require './spec/helper'

describe "String#to_regexp" do
 
  context "fail cases" do
    specify { expect("reg".to_regexp).to be_nil }
    specify { expect("/reg".to_regexp).to be_nil }
    specify { expect("reg/".to_regexp).to be_nil }
    specify { expect("reg/i".to_regexp).to be_nil }
    specify { expect("/reg/mk".to_regexp).to be_nil }
  end

  context "pass cases" do
    specify { expect("/reg/".to_regexp).to eq(/reg/) }
    specify { expect("/reg/i".to_regexp).to eq(/reg/i) }
    specify { expect("/reg/m".to_regexp).to eq(/reg/m) }
    specify { expect("/reg/x".to_regexp).to eq(/reg/x) }
    specify { expect("/reg/im".to_regexp).to eq(/reg/im) }
    specify { expect("/reg/ix".to_regexp).to eq(/reg/ix) }
    specify { expect("/reg/imx".to_regexp).to eq(/reg/imx) }
    specify { expect("  /reg/i ".to_regexp).to eq(/reg/i) }
    specify { expect("   /reg/    ".to_regexp).to eq(/reg/) }
  end
end
