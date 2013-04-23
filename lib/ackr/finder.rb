# -*- encoding: utf-8 -*-

module Ackr
  class Finder

    def initialize search_term
      @search_term = search_term.downcase
    end

    def run
      Dir.glob('**/*').each do |f|
        next if File.directory?(f)
        next if Ackr::binary?(f)
        @file = f
        search
      end
    end

    private

      def search
        results = search_into_file
        unless results.empty?
          puts Colorizer::for_file(@file)
          results.each {|r| puts r}
          puts ""
        end
      end

      def search_into_file
        result = []
        File.readlines(@file).each_with_index do |line, i|
          if line.downcase.include?(@search_term)
            result << "#{'%4i' % i}| #{Colorizer::for_line(line, @search_term)}"
          end
        end
        result
      end

  end
end
