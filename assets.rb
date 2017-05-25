set :assets, Sprockets::Environment.new

# Configure sprockets
settings.assets.append_path "assets/js"
settings.assets.append_path "assets/css"

# For compressed JS and CSS output

settings.assets.js_compressor  = :uglify
settings.assets.css_compressor = :scss

# Alternate version (not tested)
#require "yui/compressor"
#settings.assets.js_compressor  = YUI::JavaScriptCompressor.new
#settings.assets.css_compressor = YUI::CssCompressor.new

get "/js/:file.js" do
  content_type "application/javascript"
  settings.assets["#{params[:file]}.js"]
end

get "/css/:file.css" do
  content_type "text/css"
  settings.assets["#{params[:file]}.css"]
end
