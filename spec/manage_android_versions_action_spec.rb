describe Fastlane::Actions::ManageAndroidVersionsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The manage_android_versions plugin is working!")

      Fastlane::Actions::ManageAndroidVersionsAction.run(nil)
    end
  end
end
