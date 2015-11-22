APP_FILE  = 'app.rb'
APP_CLASS = 'App'

require 'sinatra/assetpack/rake'

# Default task
task default: :spec

# Heroku deployment
desc "Deploy to Heroku and compile assets"
task :deploy do
  system "git push heroku master"
end
