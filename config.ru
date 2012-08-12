require 'rubygems'
require 'bundler'

Bundler.require

require './buckly'
run Sinatra::Application
