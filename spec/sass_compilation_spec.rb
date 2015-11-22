require_relative "spec_helper"

RSpec.describe "SASS compilation" do

  before do
    system "rake assets:precompile > /dev/null"
  end

  let(:filecontent) { File.read(File.join(__dir__, "../public/assets/application.css")) }

  it "must have some of the correct content" do
    expect(filecontent).to include "/* Application Stylesheet File"
  end

end
