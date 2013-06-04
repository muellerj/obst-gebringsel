source "https://rubygems.org"
ruby "2.0.0"

gem 'sinatra'
gem 'rdiscount', '~> 2.0.7.2'
gem 'thin'

group :assets do
  gem 'sinatra-asset-pipeline'
end

group :development do
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'wdm', :platforms => [:mswin, :mingw], :require => false
  gem 'guard'
  gem 'guard-shell'
end

group :test do
  gem 'rake'
  gem 'minitest', '~> 5.0.1'
  gem 'rack-test', :require => 'rack/test'
  gem 'webrat'
end
