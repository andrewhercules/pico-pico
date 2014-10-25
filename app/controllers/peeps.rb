post '/peeps' do
	content_type :json
	Peep.create(:message => params["message"], :user_id => session["user_id"])
	redirect to ('/')
end

