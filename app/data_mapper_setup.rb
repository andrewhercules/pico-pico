require_relative 'models/user.rb'
require_relative 'models/peep.rb'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize