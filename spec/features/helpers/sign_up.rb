def sign_up
	fill_in :email, :with =>'test@test.com'
	fill_in :password, :with => 'password_test'
	fill_in :password_confirmation, :with => 'password_test'
	fill_in :username, :with => 'hashswagbrolo'
	click_button 'Sign up'
end