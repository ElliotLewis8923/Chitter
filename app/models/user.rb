require 'bcrypt'

class User


	class Link
	 
	    include DataMapper::Resource
	 
	    storage_names[:default] = 'users_links'
	 
	    belongs_to :follower, 'User', :key => true
	 
	    belongs_to :followed, 'User', :key => true
	 
	end


 

	include DataMapper::Resource

		attr_reader :password
		attr_accessor :password_confirmation

		validates_confirmation_of :password, :message => "Sorry, your passwords don't match."

		has n, :peeps, :through => Resource

		has n, :links_to_followed_users, 'User::Link', :child_key => [:follower_id]
 
		has n, :links_to_followers, 'User::Link', :child_key => [:followed_id]
		 
		has n, :followed_users, self,
		     :through => :links_to_followed_users, 
		     :via     => :followed
		 
		has n, :followers, self,
		     :through => :links_to_followers,
		     :via     => :follower

		property :id, Serial
		property :email, String, :unique => true, :message => "Sorry, this email has already been taken."
		property :username, String, :unique => true, :message => "Sorry, this username has already been taken."
		property :password_digest, Text, :lazy => false
		property :password_token, Text, :lazy => false
		property :password_token_timestamp, Text, :lazy => false

	def follow(others)
    	followed_users.concat(Array(others))
     	save
     	self
	end

	def unfollow(others)
	    links_to_followed_users.all(:followed => Array(others)).destroy!
	    reload
	    self
	end

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

