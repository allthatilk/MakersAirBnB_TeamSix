require 'sinatra/base'

class Air_bnb < Sinatra::Base

  get '/' do
    "Hello World"
    erb :'listings/new'
  end

  post '/listings/new' do
    redirect '/'
  end

  run! if app_file == $0
end
