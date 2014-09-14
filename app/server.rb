require 'sinatra/base'
require 'capybara/rspec'
require 'data_mapper'

require_relative './models/user'

class Server < Sinatra::Base

	env = ENV['RACK_ENV'] || 'development'

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	DataMapper.finalize

	DataMapper.auto_upgrade!

  get '/' do
  	@user = session[:id]
    erb :index
  end

  post '/' do
  	User.create(:email => params[:email],
  							:password => params[:password],
  							:password_confirmation => params[:password_confirmation],
  							:username => params[:username])
  	session[:id] = User.first(:email => params[:email])
  	@user = session[:id]
  	erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
