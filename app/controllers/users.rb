  get '/users/search/:id' do
     @user = User.get(params[:id])
     @peeps = Peep.all(:user_id => @user.id)
     erb :users
  end