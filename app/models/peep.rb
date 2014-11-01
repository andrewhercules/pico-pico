class Peep

	include DataMapper::Resource

	property :id, Serial
	property :message, Text, :length => 1..150
	property :date, Text, :default => (Time.now.strftime("%B %d, %Y at %H:%M"))

	belongs_to :user

	def to_h
		{ username: user.username, name: user.name, message: message, date: date }
	end

	def self.all_as_json
		all.reverse.map(&:to_h).to_json
	end
end