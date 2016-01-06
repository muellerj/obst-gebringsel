require "bundler"
Bundler.require :default, :assets, (ENV["RACK_ENV"] || "").to_sym

require 'sprockets'
require 'sinatra/base'
require 'sinatra/sprockets-helpers'

class Application < Sinatra::Base

  register Sinatra::Sprockets::Helpers
  set :default_encoding, 'utf-8'
  set :root, File.dirname(__FILE__)
  set :assets, Sprockets::Environment.new(root)

  configure do
    assets.append_path File.join(root, 'assets', 'stylesheets')
    assets.append_path File.join(root, 'assets', 'javascripts')
    assets.append_path File.join(root, 'assets', 'images')
    assets.append_path File.join(root, 'assets', 'fonts')

    Sprockets::Helpers.configure do |config|
      config.environment = assets
      config.prefix      = '/assets'
      config.digest      = true
    end
  end

  before do
    cache_control :public, :must_revalidate, :max_age => 60
  end

  get '/' do
    haml :home
  end

  not_found do
    haml :not_found
  end

end
