  get '/' do
  	if current_user
  		@peeps = current_user.follower.peeps
  	else
    	@peeps = Peep.all
	end
	@peeps.reverse!
	@peeps_heading = "Latest peeps"
	erb :index
end