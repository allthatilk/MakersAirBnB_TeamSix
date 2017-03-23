ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/datamapper_setup'
require 'sinatra/flash'

class Air_bnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash

  get '/' do
    if params[:date]
      @spaces = Space.all - Space.all(Space.bookings.date => params[:date])
    else
      @spaces = Space.all
    end
    erb :index
  end

  post '/listings/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: current_user.id)
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
    erb :new_user
  end

  post '/users' do
    user = User.create_user(params)
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:error] = 'Sorry, this user already exists'
      erb :new_user
    end
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:error] = 'The email or password is incorrect'
      erb :new_session
    end
  end

  post '/sign_out_user' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/dashboard' do
    this_users_spaces = Space.all(user_id: current_user.id)
    @booking_requests = Booking.requests_by_space(this_users_spaces)

    erb :dashboard
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
