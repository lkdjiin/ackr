require './spec/helper'

# spec/example1/
# ├── CVS
# │   └── cvs.txt
# ├── folder
# │   ├── CVS
# │   │   └── cvs.txt
# │   ├── folder
# │   │   ├── CVS
# │   │   │   └── cvs.txt
# │   │   └── level2
# │   ├── .hidden-subfoder
# │   │   └── not-me
# │   └── level1
# ├── .hidden-folder
# │   ├── file
# │   └── .file
# ├── root
# ├── tmp
# │   └── tmp.txt
# └── .visible-file

describe Finder do

  describe "#all_files" do
    before do
      @results = []
      Dir.chdir('spec/example1/') do
        Finder::all_files {|file| @results << file }
      end
    end

    it "doesnt return a directory" do
      expect(@results.include?('folder/')).to be_falsey
    end

    it "doesnt return a binary" do
      expect(@results.include?('ackr-0.1.gem')).to be_falsey
    end

    it "returns root file" do
      expect(@results.include?('root')).to be_truthy
    end

    it "returns files in subfolders" do
      expect(@results.include?('folder/level1')).to be_truthy
      expect(@results.include?('folder/folder/level2')).to be_truthy
    end

    it "doesnt return files in tmp/" do
      expect(@results.include?('tmp/tmp.txt')).to be_falsey
    end

    it "doesnt return files in CVS/" do
      expect(@results.include?('CVS/cvs.txt')).to be_falsey
    end

    it "doesnt return files in CVS/ subfolders" do
      expect(@results.include?('folder/CVS/cvs.txt')).to be_falsey
      expect(@results.include?('folder/folder/CVS/cvs.txt')).to be_falsey
    end

    it "returns hidden files" do
      expect(@results).to include('.visible-file')
      expect(@results).to include('folder/folder/.visible-file')
    end

    it "doesnt look into hidden folders" do
      expect(@results).not_to include('.hidden-folder/file')
      expect(@results).not_to include('.hidden-folder/.file')
      expect(@results).not_to include /not-me$/
    end
  end
end
