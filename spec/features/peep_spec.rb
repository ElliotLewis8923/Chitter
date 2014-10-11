require 'spec_helper'

feature "In order to let people know what I am doing as a maker I want to post a message to chitter" do

	scenario "Post a peep" do
		visit '/'
		sign_up
		post_peep("first peep yo")
		expect(Peep.count).to eq 1
	end

	scenario "Peep has multiple hashtags" do
		visit '/'
		sign_up
		post_peep("second peep yo #peepsgottapeep #carpediem")
		expect(Hashtag.count).to eq 2
	end

	scenario "Hashtag has multiple peeps" do
		visit '/'
		sign_up
		post_peep("peeping tom #brolo")
		post_peep("asdf #brolo")
		expect(Hashtag.count).to eq 1
		expect(Peep.count).to eq 2
	end

	scenario "User has multiple peeps" do
		visit '/'
		sign_up
		post_peep("asdf")
		post_peep("why am i still working on chitter")
		user = User.first(:email => 'test@test.com')
		expect(user.peeps.count).to eq 2
	end

	scenario "Each peep has a timestamp" do
		visit '/'
		sign_up
		post_peep("why oh why am i still working on fucking #chitter")
		expect(Peep.time.class).to eq DataMapper::Property::String
	end

end

feature "In order to see what people have to say as a maker I want to see all peeps in chronological order" do

	scenario "The homepage displays peeps" do
		visit '/'
		sign_up
		post_peep("ohman")
		post_peep("sigh...")
		expect(find('article:nth-child(1)')).to have_content("sigh...")
	end

	scenario "Only peeps authoured by a specific user are displayed" do
		visit '/'
		sign_up
		post_peep("asfasfd")
		sign_out
		sign_up2
		post_peep("aaaaaaaargh")
		click_link "hashswagbrolo"
		expect(page).to have_content "asfasfd"
		expect(page).not_to have_content "aaaaaaaargh"
	end



end




