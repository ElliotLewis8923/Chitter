get '/follow/:id' do
	user = User.get(params[:id])
	if current_user.followed_users.find(user)
  		current_user.follow(user)
  		redirect '/'
  	else
  		current_user.unfollow(user)
  		redirect '/'
  	end

end