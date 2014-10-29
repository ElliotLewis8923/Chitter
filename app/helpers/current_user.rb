 	def current_user
			@current_user ||=User.get(session[:id]) if session[:id]
	end