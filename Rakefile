require 'rake/sprocketstask'
require_relative "./application"

ENV['RACK_ENV'] ||= 'development'

# Task aliases
task default: :spec
task test: :spec
task "assets:precompile" => "assets"

# RSpec testing
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

# Assets
Rake::SprocketsTask.new do |t|
  environment = Application.assets
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  t.environment = environment
  t.output      = "public/assets"
  t.assets      = %w(application.js application.css *.gif *.jpg *.png *.svg *.ttf *.otf *.eot *.woff)
end

task :assets do
  assets = Dir.glob(File.join(__dir__, 'public/assets/**/*'))
  regex = /(-{1}[a-z0-9]{32}*\.{1}){1}/
  assets.each do |file|
    next if File.directory?(file) || file !~ regex

    source = file.split('/')
    source.push(source.pop.gsub(regex, '.'))

    non_digested = File.join(source)
    FileUtils.cp(file, non_digested)
  end
end

# Heroku deployment
desc "Deploy to Heroku and compile assets"
task :deploy do
  system "git push heroku master"
end
