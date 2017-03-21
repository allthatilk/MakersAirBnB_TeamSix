ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/datamapper_setup'

class Air_bnb < Sinatra::Base

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

  run! if app_file == $0
end
