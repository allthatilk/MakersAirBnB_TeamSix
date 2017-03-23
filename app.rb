ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/datamapper_setup'
require 'sinatra/flash'

class Air_bnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash

  get '/' do
    params[:date] ? @spaces = Space.all - Space.all(Space.bookings.date => params[:date]) : @spaces = Space.all
    erb :index
  end

  post '/listings/new' do
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], url: params[:url])
    redirect '/'
  end

  get '/space' do
    @space = Space.get(params[:id])
    erb :space
  end

  post '/space/book' do
    @space = Space.get(params[:id])
    booking = !!Booking.make(@space, params[:date])
    redirect "/space?id=#{params[:id]}&confirmation=#{booking}"
  end

  get '/users/new' do
    erb:'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb:'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:error] = ['The email or password is incorrect']
      erb:'sessions/new'
    end
  end

  post '/sign_out_user' do
    session[:user_id] = nil
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
