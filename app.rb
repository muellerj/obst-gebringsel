require 'bundler'
Bundler.require :default, :assets, (ENV['RACK_ENV'] || '').to_sym
require 'sinatra/base'
require 'sinatra/asset_pipeline'
require 'rdiscount'

class App < Sinatra::Base

  Dir[__dir__ + '/lib/*.rb'].each {|file| require file }
  helpers ViewHelpers
  register Sinatra::AssetPipeline

  get '/' do
    render_static "welcome", false
  end

  not_found do
    render_static "not_found"
  end

end
