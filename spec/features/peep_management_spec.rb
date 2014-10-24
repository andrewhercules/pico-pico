require 'spec_helper'
require_relative 'helpers/session'

	feature 'When created, a peep ...' do
		
		before(:each) do
			sign_up
		end

		scenario 'will be associated with a username' do
			visit '/'
			add_peep("Sample test peep 1")
			expect(page).to have_content("testuser")
		end

		scenario 'will be associated with the real name of a user' do
			visit '/'
			add_peep("Sample test peep 1")
			expect(page).to have_content("Test User")
		end

end
