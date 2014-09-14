require 'spec_helper'

feature "In order to use chitter as a maker I want to sign up to the service" do
	
	scenario 'navigating from the homepage' do
		visit '/'
		click_link('Sign up!')
		expect(page).to have_content('Please enter your details.')
	end
end