# myapp.rb
require "sinatra/base"

class Myapp < Sinatra::Base
  # set :bind, "0.0.0.0"

  get "/" do
     'Hello world!'
  end
end
