get '/api' do
  content_type :json
  @peeps = Peep.all.reverse
	@peeps.to_json
end