require 'database_cleaner'
require './app/server'


ENV["RACK_ENV"] = 'development'

task :clean_database do
	    DatabaseCleaner.strategy = :transaction
    	DatabaseCleaner.clean_with(:truncation)
	    DatabaseCleaner.start
	    DatabaseCleaner.clean
	puts "Database cleansing completed!"
end