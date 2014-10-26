get '/api' do
 	
	@peeps = Peep.all.reverse 	
	@api_data = Array.new

	@peeps.each do |peep|
		ind_peep = Hash.new
			ind_peep["username"] = peep.user.username
			ind_peep["name"] = peep.user.name
			ind_peep["message"] = peep.message
			ind_peep["date"] = peep.date
		@api_data << ind_peep
	
	end

	JSON.generate(@api_data)

end



# Results in /api page showing <DataMapper::Query>

#  	@api_hash = {
# 		"username" => Peep.user.username,
# 		"name" => Peep.user.name,
# 		"date" => Peep.date,
# 		"message" => Peep.message,		
#  	}




# 	@api_hash.to_json
