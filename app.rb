require "rubygems"
require "bundler"
require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/json"
require "sinatra/cookies"
require "sinatra/flash"
require "sinatra/assetpack"
require "data_mapper"
require "dm-migrations"
require "dm-sqlite-adapter"
require "rack"
Bundler.require(:default)

# Configuration

configure do
	enable :sessions
	set :json_encoder, :to_json
	set :erb, :layout => :layout

end

# Asset Management

register Sinatra::AssetPack

assets do
  js :main, [
    "http://code.jquery.com/jquery.min.js",
    "http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js",
    "/js/*.js",
    "/js/*/*.js",
    "/js/*/*/*.js"
    
  ]
  css :main, [
    "http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css",
    "/css/*.css",
    "/css/*/*.css",
    "/css/*/*/*.css",
  ]
end







# Controller


get "/" do
  # flash[:info] = 'This is a flash message'
  erb :index
end









# Helpers

helpers do
  
  def boldify(text)
    return "<strong>#{text}</strong>"
  end

end




# CORS Config

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






# Database Config

DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/development.sqlite3")

class User
  include DataMapper::Resource

  property :id, Serial
  # ...



end

DataMapper.finalize.auto_upgrade!