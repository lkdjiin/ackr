require './spec/helper'

describe Colorizer do

  describe "#for_file" do
    it "should colorize filename" do
      string = "path/to/file"
      expected = Rainbow(string).fg(:blue).bright.underline
      expect(Colorizer::for_file(string)).to eq(expected)
    end
  end

  describe "#for_line" do
    it "should colorize matched term" do
      string = "123 456 789"
      expected = "123 " + Rainbow("456").bright + " 789"
      expect(Colorizer::for_line(string, "456")).to eq(expected)
    end

    it "should colorize matched terms" do
      string = "123 456 789 456"
      expected = "123 " + Rainbow("456").bright + " 789 " + Rainbow("456").bright
      expect(Colorizer::for_line(string, "456")).to eq(expected)
    end

    it "should be case insensitive" do
      string = "AAA BBB CCC"
      expected = "AAA " + Rainbow("BBB").bright + " CCC"
      expect(Colorizer::for_line(string, "bbb")).to eq(expected)
    end
  end
end

