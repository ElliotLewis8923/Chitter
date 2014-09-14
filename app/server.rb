require 'sinatra/base'

class server.rb < Sinatra::Base
  get '/' do
    'Hello server.rb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
