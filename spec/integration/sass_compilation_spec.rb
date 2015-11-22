require_relative "../spec_helper"

RSpec.describe "SASS compilation", type: :feature do

  before do
    visit "/css/application.css"
  end

  it "must be present" do
    expect(page.status_code).to eq 200
  end

  it "must have some of the correct content" do
    expect(page.body).to include "/*\n Application Stylesheet File"
  end

end
