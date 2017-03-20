ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Air_bnb < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/listings/new' do
    redirect '/'
  end

  run! if app_file == $0
end
