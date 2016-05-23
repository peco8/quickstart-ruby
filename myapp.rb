require "sinatra/base"

class Myapp < Sinatra::Base
  get "/" do
     'Hello world!'
  end
end
