gem 'rainbow', '~> 2.2'
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
      Rainbow(string).fg(:blue).bright.underline
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
        string.gsub(search) {|exp| Rainbow(exp).bright }
      rescue Exception => ex
        puts Rainbow("Error ").bg(:red) + ex.message
      end
    end
  end
end
