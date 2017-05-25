get '/' do
  flash[:info] = 'This is a flash message'
  slim :index
end

get '/cookie_demo' do
  cookies.merge! 'foo' => 'bar', 'bar' => 'baz'
  cookies.keep_if { |key, value| key.start_with? 'b'  }
  foo, bar = cookies.values_at 'foo', 'bar'
  "size: #{cookies.length}"
end
