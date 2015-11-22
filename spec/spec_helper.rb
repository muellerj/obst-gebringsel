ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require_relative "../app"

module AppHelper
  def app
    App
  end
end

RSpec.configure do |config|
  config.include AppHelper
end

Capybara.app = App
