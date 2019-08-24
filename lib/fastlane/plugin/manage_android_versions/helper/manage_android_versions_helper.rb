module Fastlane
  module Helper
    class ManageAndroidVersionsHelper
      # require "shellwords"
      # require "tempfile"
      require "fileutils"

      def self.read_key_from_gradle_file(gradle_file, key)
        value = false
        begin
          file = File.new(gradle_file, "r")
          while (line = file.gets)
            next unless line.include?(key)
            components = line.strip.split(' ')
            value = components[components.length - 1].tr("\"", "")
            break
          end
          file.close
        rescue => err
          UI.error("An exception occured while reading gradle file: #{err}")
          err
        end
        return value
      end
    end
  end
end
