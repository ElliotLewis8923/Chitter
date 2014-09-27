require 'sinatra/base'
require 'capybara/rspec'
require 'data_mapper'
require 'rack-flash'

require_relative './models/user'
require_relative './models/peep'
require_relative './models/hashtag'


class Server < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	set :partial_template_engine, :erb

	env = ENV['RACK_ENV'] || 'development'

	DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

	DataMapper.finalize

	DataMapper.auto_upgrade!

	use Rack::MethodOverride

	use Rack::Flash

 

  get '/' do
    erb :index
  end

  post '/' do
  	@account = User.new( :email => params[:email],
  										:password => params[:password],
  										:password_confirmation => params[:password_confirmation],
  										:username => params[:username])
	  if @account.save
	  	#session[:id] = User.first(:email => params[:email])
	  	erb :index
	  else
	  	flash.now[:errors] = @account.errors.full_messages
	  end
  end

  delete '/sessions' do
  	session[:id] = nil
  	redirect to '/'
	end

  post '/sessions/new' do
  	login = User.authenticate(params[:email_login], params[:password_login])
  	if login
  		session[:id] = User.first(:email => params[:email_login]).id
  		redirect to '/'
 		else
 			flash[:notice] = "Sorry, your login details could not be found on our database."
 		end
 	end

  post '/peep' do
    text = params[:peep]
    
    peep = Peep.create( :user => User.get(session[:id]),
                     :text => text)
    puts 'yo'
   # hashtags = text.scan(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i).flatten!.map { |e| Hashtag.new(:name => e, :peeps => peep) }
    redirect to '/'
  end

 	def current_user
			@current_user ||=User.get(session[:id]) if session[:id]
	end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
