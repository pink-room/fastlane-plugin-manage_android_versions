require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class ManageAndroidVersionsHelper
      # class methods that you define here become available in your action
      # as `Helper::ManageAndroidVersionsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the manage_android_versions plugin helper!")
      end
    end
  end
end
