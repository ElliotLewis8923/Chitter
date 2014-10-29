require 'spec_helper'

feature "In order to let people know what I am doing as a maker I want to post a message to chitter" do

	before(:each) do
		visit '/'
		sign_up
	end

	scenario "Post a peep" do
		post_peep("first peep yo")
		expect(Peep.count).to eq 1
	end

	scenario "Peep has multiple hashtags" do
		post_peep("second peep yo #peepsgottapeep #carpediem")
		expect(Hashtag.count).to eq 2
	end

	scenario "Hashtag has multiple peeps" do
		post_peep("peeping tom #brolo")
		post_peep("asdf #brolo")
		expect(Hashtag.count).to eq 1
		expect(Peep.count).to eq 2
	end

	scenario "User has multiple peeps" do
		post_peep("asdf")
		post_peep("why am i still working on chitter")
		user = User.first(:email => 'test@test.com')
		expect(user.peeps.count).to eq 2
	end

	scenario "Each peep has a timestamp" do
		post_peep("why oh why am i still working on fucking #chitter")
		expect(Peep.time.class).to eq DataMapper::Property::String
	end

end

feature "In order to see what people have to say as a maker I want to see all peeps in chronological order" do

	before(:each) do
		visit '/'
		sign_up
	end

	scenario "The homepage displays peeps" do
		post_peep("ohman")
		post_peep("sigh...")
		sign_out
		expect(find('article:nth-child(1)')).to have_content("sigh...")
	end

	scenario "Only peeps authoured by a specific user are searched displayed" do
		post_peep("asfasfd")
		post_peep("waaah")
		sign_up2
		post_peep("aaaaaaaargh")
		sign_out
		click_link('@hashswagbrolo', match: :first)
		expect(page).to have_content "asfasfd"
		expect(page).not_to have_content "aaaaaaaargh"
	end

	scenario "Only peeps with a specific hashtag are searched and displayed" do
		post_peep("dadadada #moomoomoomoo")
		post_peep("asdf")
		sign_out
		click_link "#moomoomoomoo"
		expect(page).to have_content "dadadada"
		expect(page).not_to have_content "asdf"
	end

	scenario

	scenario "Only the user's followers' peeps are displayed on the homepage" do
		post_peep("followed peep #suchmanytomany")
		sign_up2
		expect(page).not_to have_content "followed peep #suchmanytomany"
		visit '/hashswagbrolo'
		click_link 'follow'
		expect(page).to have_content "followed peep #suchmanytomany"	
	end	



end




