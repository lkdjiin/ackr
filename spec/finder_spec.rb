# -*- encoding: utf-8 -*-

require './spec/helper'

describe Finder do

  describe "#all_files" do
    before do
      @results = []
      Dir.chdir('spec/example1/') do
        Finder::all_files {|file| @results << file }
      end
    end

    it "should not returns a directory" do
      @results.include?('folder/').should be_false
    end
    
    it "should not returns a binary" do
      @results.include?('ackr-0.1.gem').should be_false
    end

    it "should returns root file" do
      @results.include?('root').should be_true
    end

    it "should returns files in subfolders" do
      @results.include?('folder/level1').should be_true
      @results.include?('folder/folder/level2').should be_true
    end

  end
end
