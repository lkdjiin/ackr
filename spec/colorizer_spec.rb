# -*- encoding: utf-8 -*-

require './spec/helper'

describe Colorizer do

  describe "#for_file" do
    it "should colorize filename" do
      string = "path/to/file"
      expect = string.foreground(:blue).bright.underline
      expect(Colorizer::for_file(string)).to eq(expect)
    end
  end

  describe "#for_line" do
    it "should colorize matched term" do
      string = "123 456 789"
      expect = "123 " + "456".bright + " 789"
      expect(Colorizer::for_line(string, "456")).to eq(expect)
    end

    it "should colorize matched terms" do
      string = "123 456 789 456"
      expect = "123 " + "456".bright + " 789 " + "456".bright
      expect(Colorizer::for_line(string, "456")).to eq(expect)
    end

    it "should be case insensitive" do
      string = "AAA BBB CCC"
      expect = "AAA " + "BBB".bright + " CCC"
      expect(Colorizer::for_line(string, "bbb")).to eq(expect)
    end
  end
end

