require 'rack/test'
require_relative '../../app'
require_relative 'custom_matchers'

# Setup Test environment
class MiniTest::Spec
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  def app
    Rack::Builder.parse_file(File.dirname(__FILE__) + '/../../config.ru').first
  end
end

# Configure webrat
Webrat.configure do |config|
  config.mode = :rack
end
