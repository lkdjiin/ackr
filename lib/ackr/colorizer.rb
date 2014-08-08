# -*- encoding: utf-8 -*-

gem 'rainbow', '= 1.99.2'
require 'rainbow'

module Ackr

  # Methods to add terminal color commands into strings.
  module Colorizer

    # Public: Highlight a filename.
    #
    # string - The filename.
    #
    # Returns the String filename highlighted.
    def self.for_file string
      string.foreground(:blue).bright.underline
    end

    # Public: Highlight a matched file line.
    #
    # string - The line.
    # search - The String search term.
    #
    # Returns the String line highlighted.
    def self.for_line string, search
      search = Regexp.new(search, Regexp::IGNORECASE) if search.is_a?(String)
      begin
        string.gsub(search) {|exp| exp.bright }
      rescue Exception => ex
        puts "Error ".background(:red) + ex.message
      end
    end
  end
end
