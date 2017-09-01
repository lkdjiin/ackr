module Ackr

  # All 'find a file' relatives.
  module Finder

    # Get all files to look for.
    #
    # Files of interest are those who are
    #   + not directory
    #   + not binary
    #   + not inside a hidden folder
    #
    # Returns nothing.
    #
    def self.all_files
      Dir.glob('**/*', File::FNM_DOTMATCH).each do |file|
        next if File.directory?(file)
        next if inside_hidden_folder?(file)
        next if Ackr.binary?(file)

        next if EXCLUDE_DIRS.any? do |dir|
          file.start_with?(dir + File::Separator) ||
            file.include?(File::Separator + dir + File::Separator)
        end

        yield(file)
      end
    end

    def self.inside_hidden_folder?(file)
      part_of_hidden_folder?(file) || part_of_hidden_subfolder?(file)
    end

    private

    def self.part_of_hidden_folder?(file)
      file.start_with?('.') && file.include?(File::Separator)
    end

    def self.part_of_hidden_subfolder?(file)
      file =~ /\/\..*\//
    end
  end
end
