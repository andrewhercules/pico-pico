class Peep

	include DataMapper::Resource

	property :id, Serial
	property :message, Text, :length => 1..150
	property :date, Text, :default => (Time.now.strftime("%B %d, %Y at %H:%M"))

	belongs_to :user

end