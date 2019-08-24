require 'fastlane/action'
require_relative '../helper/manage_android_versions_helper'

module Fastlane
  module Actions
    class GetVersionNameAction < Action
      def self.run(params)
        UI.message("Getting version name!")

        version_major = Helper::ManageAndroidVersionsHelper.read_key_from_gradle_file(params[:gradle_file], "versionMajor")
        version_minor = Helper::ManageAndroidVersionsHelper.read_key_from_gradle_file(params[:gradle_file], "versionMinor")
        version_patch = Helper::ManageAndroidVersionsHelper.read_key_from_gradle_file(params[:gradle_file], "versionPatch")
        version_build = Helper::ManageAndroidVersionsHelper.read_key_from_gradle_file(params[:gradle_file], "versionBuild")
        version_name = Helper::ManageAndroidVersionsHelper.read_key_from_gradle_file(params[:gradle_file], "versionName")

        version_name["${versionMajor}"] = version_major
        version_name["${versionMinor}"] = version_minor
        version_name["${versionPatch}"] = version_patch
        version_name["${versionBuild}"] = version_build

        version_name
      end

      def self.description
        "Gets your App version name."
      end

      def self.authors
        ["Bruno Correia"]
      end

      def self.return_value
        "The version name of your App."
      end

      def self.details
        "This action returns your App current version name."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :gradle_file,
                                  env_name: "GRADLE_FILE_PATH",
                               description: "Specify the path to your app build.gradle. Default: app/build.gradle",
                                  optional: true,
                                      type: String,
                             default_value: "app/build.gradle",
                              verify_block: proc do |value|
                                UI.user_error!("Could not find the build.gradle file") unless File.exist?(value)
                              end)
        ]
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
