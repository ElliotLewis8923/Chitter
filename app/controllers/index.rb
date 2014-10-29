  get '/' do
    @peeps = Peep.all
    @peeps.reverse!
    erb :index
  end