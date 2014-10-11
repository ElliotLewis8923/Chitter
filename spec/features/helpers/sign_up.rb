def sign_up
	fill_in :email, :with =>'test@test.com'
	fill_in :password, :with => 'password_test'
	fill_in :password_confirmation, :with => 'password_test'
	fill_in :username, :with => 'hashswagbrolo'
	click_button 'Sign up'
end

def sign_up2
	fill_in :email, :with =>'test2@test2.com'
	fill_in :password, :with => 'password_test2'
	fill_in :password_confirmation, :with => 'password_test2'
	fill_in :username, :with => 'bunchie'
	click_button 'Sign up'
end


def sign_in
	fill_in :email_login, :with => 'test@test.com'
	fill_in :password_login, :with => 'password_test'
	click_button 'Sign in'
end