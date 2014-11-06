post '/follow/:id' do
	user = User.get(params[:id])
	#if current_user.followers.map(&:!= user)
  	current_user.follow(user)
  	redirect "/users/#{user.username}"
end

delete '/unfollow/:id' do
	user = User.get(params[:id])
	#if current_user.followers.map(&:== user)
	current_user.unfollow(user)
  	redirect "/users/#{user.username}"
end