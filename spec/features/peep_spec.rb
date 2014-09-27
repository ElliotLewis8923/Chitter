require 'spec_helper'

feature "In order to let people know what I am doing as a maker I want to post a message to chitter" do

	scenario "Post a peep" do
		visit '/'
		sign_up
		sign_in
		find_field('peep')
		fill_in :peep, :with => "first peep yo #peepsgottapeep #carpediem"
		click_button 'Post your peep!'
		expect(Peep.count).to eq 1
	end

	scenario "Peep has multiple hashtags" do
		visit '/'
		sign_up
		sign_in
		find_field('peep')
		fill_in :peep, :with => "first peep yo #peepsgottapeep #carpediem"
		click_button 'Post your peep!'
		expect(Hashtag.count).to eq 2
	end


end