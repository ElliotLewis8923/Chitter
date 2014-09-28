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

	scenario "User has multiple peeps" do
		visit '/'
		message1 = "asdf"
		message2 = "why am i still working on chitter"
		sign_up
		sign_in
		post_peep(message1)
		post_peep(message2)
		user = User.first(:email => 'test@test.com')
		expect(user.peeps.count).to eq 2
	end

	scenario "Each peep has a timestamp" do
		visit '/'
		message = "why oh why am i still working on fucking #chitter"
		sign_up
		sign_in
		post_peep(message)
		expect(Peep.time.class).to eq DataMapper::Property::String
	end

end

feature "In order to see what people have to say as a maker I want to see all peeps in chronological order" do

	scenario "The homepage displays peeps" do
		visit '/'
		message1 = "ohman"
		message2 = "sigh..."
		sign_up
		sign_in
		post_peep(message1)
		post_peep(message2)
		expect(find('article:nth-child(1)')).to have_content("sigh...")
	end


end




