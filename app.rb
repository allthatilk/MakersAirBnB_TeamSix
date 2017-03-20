require 'sinatra/base'

class Air_bnb < Sinatra::Base

  get '/' do
    "Hello World"
  end

run! if app_file == $0
end
