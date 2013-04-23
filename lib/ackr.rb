# -*- encoding: utf-8 -*-

require 'ackr/search'
require 'ackr/colorizer'
require 'ackr/finder'

module Ackr
  # Method taken from: https://github.com/djberg96/ptools
  # --
  #
  # Returns whether or not +file+ is a binary file. Note that this is
  # not guaranteed to be 100% accurate. It performs a "best guess" based
  # on a simple test of the first +File.blksize+ characters.
  #
  # Example:
  #
  # File.binary?('somefile.exe') # => true
  # File.binary?('somefile.txt') # => false
  #--
  # Based on code originally provided by Ryan Davis (which, in turn, is
  # based on Perl's -B switch).
  #
  def self.binary?(file)
    str = (File.read(file, File.stat(file).blksize) || "").split(//)
    size = str.size
    ((size - str.grep(" ".."~").size) / size.to_f) > 0.30
  end
end
