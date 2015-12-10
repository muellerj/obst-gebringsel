require_relative "spec_helper"

RSpec.describe "SASS compilation" do

  before do
    system("rm -rf public")
    system("rake assets > /dev/null 2>&1")
  end

  let(:stylesheet_file) { Dir.glob("#{__dir__}/../public/assets/application-*.css").first }

  it "must have some of the correct content" do
    expect(File.read(stylesheet_file)).to include ".application-stylesheet-file"
  end

end
