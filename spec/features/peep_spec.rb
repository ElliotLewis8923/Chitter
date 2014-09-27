require 'spec_helper'

feature "In order to let people know what I am doing as a maker I want to post a message to chitter" do

	scenario "Post a peep" do
		visit '/'
		message = "first peep yo"
		sign_up
		sign_in
		post_peep(message)
		expect(Peep.count).to eq 1
	end

	scenario "Peep has multiple hashtags" do
		visit '/'
		message = "second peep yo #peepsgottapeep #carpediem"
		sign_up
		sign_in
		post_peep(message)
		expect(Hashtag.count).to eq 2
	end

	scenario "Hashtag has multiple peeps" do
		visit '/'
		message1 = "peeping tom #brolo"
		message2 = "asdf #brolo"
		sign_up
		sign_in
		post_peep(message1)
		post_peep(message2)
		expect(Hashtag.count).to eq 1
		expect(Peep.count).to eq 2
	end

end