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
    erb :index
  end

  get '/user/sign_up' do
  	erb :sign_up
  end

  post '/user/sign_up' do
  	User.create(:email => params[:email],
  							:password => params[:password],
  							:password_confirmation => params[:password_confirmation])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
