require 'spec_helper'

feature "In order to let people know what I am doing as a maker I want to post a message to chitter" do

	scenario "Post a peep" do
		message = "first peep yo"
		post_peep(message)
		expect(Peep.count).to eq 1
	end

	scenario "Peep has multiple hashtags" do
		message = "first peep yo #peepsgottapeep #carpediem"
		post_peep(message)
		expect(Hashtag.count).to eq 2
	end


end