post '/peeps' do
	Peep.create(:message => params["message"], :user_id => session["user_id"])
	redirect to ('/')
end