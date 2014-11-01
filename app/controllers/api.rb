get '/api' do
	@api_data = Peep.all_as_json
end