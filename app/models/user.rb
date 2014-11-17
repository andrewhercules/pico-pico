require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation


	property :id, Serial
	property :name, String
	property :username, String, length: 5..20, unique: true, message: "This username has already been registered. Please choose another username."
	property :email, String, unique: true, message: "This email has already been registered. Please use another email address"
	property :password_digest, Text
	property :password_token, Text, default: ' '
	property :password_token_timestamp, Text, default: ' ' 

	has n, :peeps

	validates_confirmation_of :password, :message => "Your passwords do not match - try again!"

	validates_uniqueness_of :username, :email

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(:username => username)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end