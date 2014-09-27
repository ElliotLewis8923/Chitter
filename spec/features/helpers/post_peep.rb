def post_peep(message)
	find_field('peep')
	fill_in :peep, :with => message
	click_button 'Post your peep!'
end