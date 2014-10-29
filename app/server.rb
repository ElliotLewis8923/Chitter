require 'sinatra'
require 'capybara/rspec'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/hashtag'
require_relative 'helpers/hashtag_collector'
require_relative 'helpers/current_user'
require_relative 'controllers/hashtags'
require_relative 'controllers/index'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/follow'

include HashtagCollector

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
use Rack::MethodOverride
use Rack::Flash

enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb
