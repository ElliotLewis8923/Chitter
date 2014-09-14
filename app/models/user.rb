require 'bcrypt'

class User

	include DataMapper::Resource

		attr_reader :password
		attr_accessor :password_confirmation

		validates_confirmation_of :password, :message => "Sorry, your passwords don't match."

		property :id, Serial
		property :email, String, :unique => true, :message => "Sorry, this email has already been taken."
		property :password_digest, Text, :lazy => false
		property :password_token, Text, :lazy => false
		property :password_token_timestamp, Text, :lazy => false

		def password=(password)
			@password = password
			self.password_digest = BCrypt::Password.create(password)
		end

		def self.authenticate(email, password)
			user = first(:email => email)
			if 
				user && BCrypt::Password.new(user.password_digest) == password
				user
			else
				nil
			end
		end
	
	end

