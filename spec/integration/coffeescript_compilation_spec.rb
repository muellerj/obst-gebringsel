require_relative "../spec_helper"

unless /cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM
  RSpec.describe "Coffeescript compilation", type: :feature do

    before do
      visit "/js/application.js"
    end

    it "must be present" do
      expect(page.status_code).to eq 200
    end

    it "must have some of the correct content" do
      expect(page.body).to include "/*\n Application Javascript File"
    end

  end
end
