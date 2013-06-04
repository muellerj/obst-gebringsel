require 'rake/testtask'
require 'sinatra/asset_pipeline/task.rb'
require_relative 'app'

# Default task
task default: :test

# ... is testing
Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
end

# Assets precompilation task
Sinatra::AssetPipeline::Task.define! App

# Heroku deployment
desc "Deploy to Heroku and compile assets"
task :deploy do
  system "git push heroku master"
end
