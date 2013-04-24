# -*- encoding: utf-8 -*-

module Ackr

  # All 'find a file' relatives.
  module Finder

    # Public: Get all files to look for.
    #
    # Files of interest are those who are
    #   + not directory
    #   + not binary
    #   + not hidden
    #
    # Returns an Enumerator of String filename.
    def self.all_files
      Dir.glob('**/*').each do |file|
        next if (File.directory?(file) || Ackr::binary?(file))
        next if EXCLUDE_DIRS.any? do |dir|
          file.start_with?(dir + File::Separator) || 
            file.include?(File::Separator + dir + File::Separator)
        end
        yield(file)
      end
    end
  end
end
