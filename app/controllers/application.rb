get '/' do
	@peeps = Peep.all.reverse
	erb :index
end