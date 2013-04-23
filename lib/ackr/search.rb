# -*- encoding: utf-8 -*-

module Ackr

  # Search for an expression into all text files under
  # current directory AND print results.
  #
  # FIXME Separate behaviours: search / print
  class Search

    # Public:
    #
    # search_term - The String to look for.
    def initialize search_term
      @search_term = search_term.downcase
      @format = Formatter.new @search_term
    end

    # Public: Launch the search.
    def run
      Finder::all_files do |file|
        @file = file
        search
      end
    end

    private

      def search
        results = search_into_file
        unless results.empty?
          puts Colorizer::for_file(@file)
          results.each {|res| puts res}
          puts ""
        end
      end

      def search_into_file
        result = []
        File.readlines(@file).each_with_index do |line, idx|
          if line.downcase.include?(@search_term)
            result << @format.line(line, idx + 1)
          end
        end
        result
      end

  end
end
