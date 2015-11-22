require 'bundler'
Bundler.require :default, :assets, (ENV['RACK_ENV'] || '').to_sym
require 'sinatra/base'
require 'sinatra/asset_pipeline'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  Dir[__dir__ + "/lib/*.rb"].each { |file| require file }
  helpers ViewHelpers

  get '/' do
    haml :welcome
  end

  not_found do
    haml :not_found
  end
end
