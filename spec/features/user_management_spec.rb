require 'spec_helper'

feature "In order to use chitter as a maker I want to sign up to the service" do
	
	scenario 'sign up' do
		visit '/'
		expect(page).to have_content("Don't have an account? Enter your details to sign up.")
		sign_up
		expect(User.count).to eq 1
	end

end

feature "In order to user chitter as a maker I want to log in" do

	scenario 'signing in' do
		visit '/'
		sign_up
		expect(page).to have_content('@hashswagbrolo')
	end

end

feature "In order to avoid others to use my account as a maker I want to log out" do

	scenario 'logging out' do
		visit '/'
		sign_up
		click_button('Sign out')
		expect(page).to have_content("Don't have an account? Enter your details to sign up.")
	end

end

feature "In order to connect with other users, I want to follow and unfollow" do

	before(:each) do
		visit '/'
		sign_up
		post_peep('testpeep')
		sign_up2
	end

	scenario 'following' do
		expect(page).not_to have_content 'testpeep'
		visit '/users/hashswagbrolo'
		click_button 'follow'
		visit '/'
		expect(page).to have_content 'testpeep'
	end

	scenario 'unfollowing' do
		visit '/users/hashswagbrolo'
		click_button 'follow'
		expect(page).to have_content 'testpeep'
		visit '/users/hashswagbrolo'
		click_button 'unfollow'
		visit '/'
		expect(page).not_to have_content 'testpeep'
	end
end

feature "In order to network, I want to see users followers and following" do

	before(:each) do
		visit '/'
		sign_up
		post_peep('testpeep')
		sign_up2
	end

	scenario 'followers' do
		visit '/users/hashswagbrolo'
		click_button 'follow'
		expect(page).to have_content 'bunchie'
	end


end
