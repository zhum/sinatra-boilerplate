require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/json"
require "sinatra/cookies"
require "sinatra/flash"
require './controller'
require './model'
require './assets'
require './helpers'
require "rack"
require "rack/cors"

configure do
	enable :sessions
	set :json_encoder, :to_json
	set :erb, :layout => :layout

end

use Rack::Cors do |config|
  config.allow do |allow|
    allow.origins "*"
    allow.resource "/file/list_all/", :headers => :any
    allow.resource "/file/at/*",
        :methods => [:get, :post, :put, :delete],
        :headers => :any,
        :max_age => 0
  end
end

before do
  headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, DELETE, OPTIONS"
  headers["Access-Control-Allow-Origin"] = "*"
  headers["Access-Control-Allow-Headers"] = "accept, authorization, origin"
end

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS,POST"
  # Needed for AngularJS
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
end