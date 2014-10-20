class Hashtag

	include DataMapper::Resource

		has n, :peeps, :through => Resource

		validates_uniqueness_of :name

		property :id, Serial
		property :name, String

end