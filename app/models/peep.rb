class Peep

	include DataMapper::Resource

	has 1, :user, :through => Resource
	has n, :hashtags, :through => Resource

	property :id, Serial
	property :text, Text

end