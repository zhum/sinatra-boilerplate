require "sinatra/assetpack"

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