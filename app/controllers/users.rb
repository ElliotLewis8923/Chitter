  get '/users/:username' do
     @user = User.first(:username => params[:username])
     @peeps = Peep.all(:user => @user)
     erb :users
  end