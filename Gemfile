source "https://rubygems.org"
ruby File.read(".ruby-version").strip

gem "sinatra"
gem "haml"
gem "thin"

group :assets do
  gem "sinatra-assetpack", :require => "sinatra/assetpack"
  gem "sass"
  gem "coffee-script"
  gem "rake"
  gem "bourbon"
end

group :test do
  gem "rspec"
  gem "capybara"
end
