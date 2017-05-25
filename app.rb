require 'rubygems'
require 'bundler'
Bundler.require(:default)

require 'sinatra/reloader' if development?
require './controller'
require './model'
require './assets'
require './helpers'

configure do
  enable :sessions
  set :json_encoder, :to_json
  #set :erb, :layout => :layout
  #set :slim, layout => :layout
end

before do
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
end

options '*' do
  response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
  response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
end
