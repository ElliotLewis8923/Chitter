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
		expect(page).to have_content('Signed in as hashswagbrolo!')
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
