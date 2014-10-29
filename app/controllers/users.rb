  get '/:id' do
     @user = User.first(:username => params[:id])
     @peeps = Peep.all(:user_id => @user.id)
     erb :users
  end