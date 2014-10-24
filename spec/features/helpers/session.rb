module SessionHelpers

	def add_peep(message)
				within('#new-peep') do
				fill_in 'message', :with => message
				click_button 'Post'
			end
	end

	def sign_up(name = "Test User",
							username = "testuser",
							email = "test@email.com",
							password = "123456",
							password_confirmation = "123456")
		visit '/users/new'
		expect(page.status_code).to eq (200)
		fill_in :name, :with => name
		fill_in :username, :with => username
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Sign up"
	end

	def sign_in(username, password)
		visit '/sessions/new'
		fill_in 'username', :with => username
		fill_in 'password', :with => password
		click_button 'Sign in'
	end

	def forgot_password(username, email)
		visit '/sessions/new'
		click_on 'Forgot your password?'
		visit '/forgotpassword'
		fill_in 'username', :with => username
		fill_in 'email', :with => email
		click_button 'Submit'
	end

end