require 'spec_helper'

feature "In order to use chitter as a maker I want to sign up to the service" do
	
	scenario 'navigating from the homepage' do
		visit '/'
		click_link('Sign up!')
		expect(page).to have_content('Please enter your details.')
	end

	scenario 'signing up' do
		visit 'user/sign_up'
		fill_in :email, :with => 'test@test.com'
		fill_in :password, :with => 'password_test'
		fill_in :password_confirmation, :with => 'password_test'
		click_button "Sign up"
		expect(User.count).to be > 0
	end

end