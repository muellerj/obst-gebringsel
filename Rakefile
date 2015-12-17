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
  fingerprint = /\-[0-9a-f]{32}*\./
  Dir["public/assets/**/*"].each do |file|
    next if file !~ fingerprint
    next if File.directory?(file)
    next if file.split(File::Separator).last =~ /^manifest/

    nondigest = file.sub(fingerprint, '.')
    FileUtils.cp(file, nondigest, verbose: true)
  end
end

# Heroku deployment
desc "Deploy to Heroku and compile assets"
task :deploy do
  system "git push heroku master"
end
