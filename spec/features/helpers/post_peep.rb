def post_peep(message)
	visit '/'
	sign_up
	sign_in
	find_field('peep')
	fill_in :peep, :with => message
	click_button 'Post your peep!'
end