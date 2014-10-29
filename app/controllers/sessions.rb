  post '/sessions' do
  	@account = User.new( :email => params[:email],
  										:password => params[:password],
  										:password_confirmation => params[:password_confirmation],
  										:username => params[:username])
	  if @account.save
	  	session[:id] = @account.id
	  	redirect to '/'
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