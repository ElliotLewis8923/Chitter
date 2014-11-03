require 'database_cleaner'
require './app/server'

task :clean_db do
	ENV["RACK_ENV"] = 'development'
	    DatabaseCleaner.strategy = :transaction
    	DatabaseCleaner.clean_with(:truncation)
	    DatabaseCleaner.start
	    DatabaseCleaner.clean
	puts "Database cleansing completed!"
end

task :clean_test_db do
	ENV["RACK_ENV"] = 'test'
	    DatabaseCleaner.strategy = :transaction
    	DatabaseCleaner.clean_with(:truncation)
	    DatabaseCleaner.start
	    DatabaseCleaner.clean
	puts "Database cleansing completed!"
end