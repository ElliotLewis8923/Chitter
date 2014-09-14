require 'sinatra/base'
require 'capybara/rspec'
require 'data_mapper'
require 'rack-flash'

require_relative './models/user'

class Server < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'

	env = ENV['RACK_ENV'] || 'development'

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	DataMapper.finalize

	DataMapper.auto_upgrade!

	use Rack::Flash

  get '/' do
  	@user = session[:id]
    erb :index
  end

  post '/' do
  	@account = User.new( :email => params[:email],
  										:password => params[:password],
  										:password_confirmation => params[:password_confirmation],
  										:username => params[:username])
  	@user = session[:id]
  	
	  if @account.save
	  	#session[:id] = User.first(:email => params[:email])
	  	erb :index
	  else
	  	flash.now[:errors] = @account.errors.full_messages
	  end
  end

  post '/login' do
  	login = User.authenticate(params[:email_login], params[:password_login])
  	if login
  		session[:id] = User.first(:email => params[:email_login])
  		redirect to '/'
 		else
 			flash[:notice] = "Sorry, your login details could not be found on our database."
 		end
 	end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
