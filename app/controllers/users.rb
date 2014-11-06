  get '/users/:username' do
    @user = User.first(:username => params[:username])
    @peeps = Peep.all(:user => @user)
    @peeps_heading = "@#{@user.username}'s peeps"
    erb :users
  end