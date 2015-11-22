require_relative "spec_helper"

unless /cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM
  RSpec.describe "Coffeescript compilation" do

    before do
      system "rake assets:precompile > /dev/null"
    end

    let(:filecontent) { File.read(File.join(__dir__, "../public/assets/application.js")) }

    it "must have some of the correct content" do
      expect(filecontent).to include "$(\"a.fancybox\").fancybox()"
    end

  end
end
