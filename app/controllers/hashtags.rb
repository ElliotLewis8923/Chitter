  get '/hashtags/:id' do
    @hashtag = Hashtag.get(params[:id])
    @peeps = @hashtag.peeps.all
    erb :hashtags
  end