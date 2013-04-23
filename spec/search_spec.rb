# -*- encoding: utf-8 -*-

require './spec/helper'

describe Search do

  context "when looking for a string" do

    it "should print file, line number and line" do
      Dir.chdir('spec/example1/') do
        @search = Search.new("xavier")
        $stdout.should_receive(:puts).with("\e[34m\e[1m\e[4mroot\e[0m")
        $stdout.should_receive(:puts).with("   5| \e[1mxavier\e[0m")
        $stdout.should_receive(:puts).with("")
        @search.run
      end
    end

    it "should be case insensitive" do
      Dir.chdir('spec/example1/') do
        @search = Search.new("alice")
        $stdout.should_receive(:puts).with("\e[34m\e[1m\e[4mfolder/level1\e[0m")
        $stdout.should_receive(:puts).with("   2| \e[1mALICE\e[0m")
        $stdout.should_receive(:puts).with("")
        @search.run
      end
    end

  end

  context "when looking for a regexp" do
    it "should print file, line number and line" do
      Dir.chdir('spec/example1/') do
        @search = Search.new('/xavier/')
        $stdout.should_receive(:puts).with("\e[34m\e[1m\e[4mroot\e[0m")
        # $stdout.should_receive(:puts).with("   5| \e[1mxavier\e[0m")
        $stdout.should_receive(:puts).with("   5| xavier")
        $stdout.should_receive(:puts).with("")
        @search.run
      end
    end
  end

end
