# -*- encoding: utf-8 -*-

require './spec/helper'

describe Formatter do
  before do
    @format = Formatter.new("search")
  end

  describe "#line" do

    it "should format line number" do
      result = @format.line("abc search", 1)
      expect(result.start_with?("   1")).to be_truthy
    end

    it "should add a pipe and a space after line number" do
      result = @format.line("abc search", 1)
      expect(result.start_with?("   1| ")).to be_truthy
    end

    it "should colorize search term" do
      result = @format.line("abc search", 1)
      expect(result).to eq("   1| abc " + "search".bright)
    end

    it "should suppress trailing spaces" do
      result = @format.line("     abc search", 1)
      expect(result).to eq("   1| abc " + "search".bright)
    end

    it "should suppress trailing tabs" do
      result = @format.line("\t\tabc search", 1)
      expect(result).to eq("   1| abc " + "search".bright)
    end

  end
end
