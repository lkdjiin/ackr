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
      expect(@results.include?('folder/')).to be_falsey
    end
    
    it "should not returns a binary" do
      expect(@results.include?('ackr-0.1.gem')).to be_falsey
    end

    it "should returns root file" do
      expect(@results.include?('root')).to be_truthy
    end

    it "should returns files in subfolders" do
      expect(@results.include?('folder/level1')).to be_truthy
      expect(@results.include?('folder/folder/level2')).to be_truthy
    end

    it "should not returns files in tmp/" do
      expect(@results.include?('tmp/tmp.txt')).to be_falsey
    end

    it "should not returns files in CVS/" do
      expect(@results.include?('CVS/cvs.txt')).to be_falsey
    end

    it "should not returns files in CVS/ subfolders" do
      expect(@results.include?('folder/CVS/cvs.txt')).to be_falsey
      expect(@results.include?('folder/folder/CVS/cvs.txt')).to be_falsey
    end

  end
end
