require 'spec_helper'

feature "In order to use chitter as a maker I want to sign up to the service" do
	
	scenario 'navigating from the homepage' do
		visit '/'
		expect(page).to have_content("Don't have an account? Enter your details to sign up.")
		sign_up
		expect(page).to have_content('Welcome, hashswagbrolo!')
	end

	scenario 'signing up' do
		visit '/'
		sign_up
		expect(User.count).to eq 1
	end

end

feature "In order to user chitter as a maker I want to log in" do

	scenario 'signing in' do
	end
end
