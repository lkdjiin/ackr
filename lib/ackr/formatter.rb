# -*- encoding: utf-8 -*-

module Ackr

  # Format strings to be displayed on terminal.
  class Formatter

    # Public:
    #
    # search_term - The String or Regexp to look for.
    def initialize search_term
      @search_term = search_term
    end

    # Public: format a line with matched term(s).
    #
    # line - The String line to be displayed.
    # num  - The Integer number of the line (in base 1).
    #
    # Returns a formatted String.
    def line line, num
      line.strip!
      "#{'%4i' % num}| #{Colorizer::for_line(line, @search_term)}"
    end
  end
end

