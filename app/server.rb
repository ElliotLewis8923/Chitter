require 'sinatra/base'
require 'capybara/rspec'
require 'data_mapper'

class Server < Sinatra::Base

	env = ENV['RACK_ENV'] || 'development'

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	DataMapper.finalize

	DataMapper.auto_upgrade!

  get '/' do
    'Hello server.rb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
