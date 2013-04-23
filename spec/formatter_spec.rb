# -*- encoding: utf-8 -*-

require './spec/helper'

describe Formatter do
  before do
    @format = Formatter.new("search")
  end

  describe "#line" do

    it "should format line number" do
      result = @format.line("abc search", 1)
      result.start_with?("   1").should be_true
    end

    it "should add a pipe and a space after line number" do
      result = @format.line("abc search", 1)
      result.start_with?("   1| ").should be_true
    end

    it "should colorize search term" do
      result = @format.line("abc search", 1)
      result.should == "   1| abc " + "search".bright
    end

    it "should suppress trailing spaces" do
      result = @format.line("     abc search", 1)
      result.should == "   1| abc " + "search".bright
    end

    it "should suppress trailing tabs" do
      result = @format.line("\t\tabc search", 1)
      result.should == "   1| abc " + "search".bright
    end

  end
end
