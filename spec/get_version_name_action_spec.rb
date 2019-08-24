describe Fastlane::Actions::GetVersionNameAction do
  describe 'Get version name' do
    it 'should return version name from build.gradle file' do
      available_options = Fastlane::Actions::GetVersionNameAction.available_options
      params = FastlaneCore::Configuration.create(available_options, { gradle_file: "spec/app/build.gradle" })
      result = Fastlane::Actions::GetVersionNameAction.run(params)
      expect(result).to eq("1.2.3.4")
    end
  end
end
