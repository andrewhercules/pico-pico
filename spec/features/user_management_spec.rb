require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

	scenario 'when being signed out' do
		expect{ sign_up }.to change(User, :count).by (1)
		expect(page).to have_content('Welcome, Test User!(@testuser)')
		expect(User.first.email).to eq("test@email.com")
	end

	scenario 'with a password that does not match' do
		expect{ sign_up('Test2 User', 'testuser2', 'email@email.com', 'pass1', 'pass2') }.to change(User, :count).by (0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Your passwords do not match - try again!")
	end

	scenario 'with an email that is already registered' do
		sign_up
		sign_out
		sign_up
		expect(page).to have_content("This email has already been registered. Please use another email address")
	end

	scenario 'with a username that is already registered' do
		sign_up
		sign_out
		sign_up
		expect(page).to have_content("This username has already been registered. Please choose another username.")
	end

end

feature 'User signs in' do

	before(:each) do
		User.create(:name => "Test User",
								:username => "testuser",
								:email => "test@email.com",
								:password => "123456",
								:password_confirmation => "123456")
	end

	scenario 'with correct username and password' do
		visit '/'
		expect(page).not_to have_content("Welcome, Test User!(@testuser)")
		sign_in("testuser", "123456")
		expect(page).to have_content("Welcome, Test User!(@testuser)")
	end

	scenario 'with correct username and incorrect password' do
		visit '/'
		expect(page).not_to have_content("Welcome, testuser!")
		sign_in("testuser", "abcdefg")
		expect(page).not_to have_content("Welcome, testuser!")
	end

	scenario 'with correct password and incorrect username' do
		visit '/'
		expect(page).not_to have_content("Welcome, testuser!")
		sign_in("otheruser", "123456")
		expect(page).not_to have_content("Welcome, testuser!")
	end

end

feature 'User signs out' do

	before(:each) do
		User.create(:name => "Test User",
								:username => "testuser",
								:email => "test@email.com",
								:password => "123456",
								:password_confirmation => "123456")
	end

	scenario 'while being signed in' do
		sign_in("testuser", "123456")
		click_button "Sign out"
		expect(page).to have_content("Thank you for using Pico Pico. Have a wonderful day!")
		expect(page).not_to have_content("Welcome, Test User!(@testuser)")
	end

end

feature 'User forgets password' do

	before(:each) do
		User.create(:name => "Test User",
								:username => "testuser",
								:email => "test@email.com",
								:password => "123456",
								:password_confirmation => "123456",
								:password_token => "ABC123")
	end

	scenario 'and requests new password' do
		visit '/'
		forgot_password('testuser', 'test@email.com')
		expect(current_path).to eq('/')
	end

end