  get '/' do
  	if current_user
  		@peeps = current_user.followed_users.peeps
  	else
    	@peeps = Peep.all
	end
	@peeps.reverse!
	erb :index
end