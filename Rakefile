require 'data_mapper'
require './app/data_mapper_setup.rb'
require './app/models/peep.rb'
require './app/models/user.rb'

	task :auto_upgrade do
		DataMapper.auto_upgrade!
		puts "Auto-upgrade complete - no data loss."
	end

	task :auto_migrate do
		DataMapper.auto_migrate!
		puts "Auto-migrate complete - data cold have been lost."
	end