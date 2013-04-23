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
    #               This param could be a 'real' string or a String
    #               representing a regexp. If the string looks like
    #               a regexp, it will be treated like a regexp.
    #
    # Examples:
    #   Search.new("abc")
    #   Search.new("/abc/i")
    def initialize search_term
      @search_term = search_term.to_regexp
      @search_term = search_term.downcase if @search_term.nil?
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
          found = search_into_line(line)
          result << @format.line(line, idx + 1) if found
        end
        result
      end

      def search_into_line line
        if @search_term.is_a?(String)
          line.downcase.include?(@search_term)
        else
          @search_term =~ line
        end
      end

  end
end
