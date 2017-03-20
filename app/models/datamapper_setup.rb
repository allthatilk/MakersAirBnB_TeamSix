require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './space'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bnb_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
