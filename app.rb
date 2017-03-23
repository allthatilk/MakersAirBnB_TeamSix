ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/datamapper_setup'

class Air_bnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    params[:date] ? @spaces = Space.all - Space.all(Space.bookings.date => params[:date]) : @spaces = Space.all
    erb :index
  end

  post '/listings/new' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
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
    redirect to('/')
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
