  get '/' do
  	if current_user
  		@peeps = User.get(session[:id]).followed_users.peeps
  	else
    	@peeps = Peep.all
    	@peeps.reverse!
	end
	erb :index
end