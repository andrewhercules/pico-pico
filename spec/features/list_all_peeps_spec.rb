require 'spec_helper'
require_relative 'helpers/session'

feature 'User browses the list of peeps' do

	before(:each) do
		sign_up
		@user = User.first(:username => "testuser")
		Peep.create(:message => "Test peep for challenge.",
								:date => "October 10, 2014 at 11:56",
								:user_id => @user.id)

	end

	scenario 'when visiting the homepage' do
		visit '/'
		expect(page).to have_content("Test peep for Chitter challenge.")
	end

end