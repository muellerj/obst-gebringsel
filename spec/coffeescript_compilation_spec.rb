require_relative "spec_helper"

RSpec.describe "Coffeescript compilation" do

  before do
    system("rm -rf public")
    system("rake assets > /dev/null 2>&1")
  end

  let(:javascript_file) { Dir.glob("#{__dir__}/../public/assets/application-*.js").first }

  it "must have some of the correct content" do
    expect(File.read(javascript_file)).to include "application_javascript_file"
  end

end
