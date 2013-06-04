ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :test
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
