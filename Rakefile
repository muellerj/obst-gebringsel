APP_FILE  = 'app.rb'
APP_CLASS = 'App'

require_relative "app"
require 'sinatra/assetpack/rake'

# Task aliases
task default: :spec
task "assets:precompile" => "assetpack:build"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

# Heroku deployment
desc "Deploy to Heroku and compile assets"
task :deploy do
  system "git push heroku master"
end
