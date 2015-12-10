ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require_relative "../application"

module AppHelper
  def app
    Application
  end
end

RSpec.configure do |config|
  config.include AppHelper
end

Capybara.app = Application
