ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/datamapper_setup'

class Air_bnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    @spaces = Space.all
    erb :index
  end

  post '/listings/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/'
  end

  get '/users/new' do
    erb:'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/')
  end

  run! if app_file == $0
end
