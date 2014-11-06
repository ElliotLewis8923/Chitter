  get '/hashtags/:id' do
    @hashtag = Hashtag.get(params[:id])
    @peeps = @hashtag.peeps.all
    @peeps_heading = "##{@hashtag.name}"
    erb :hashtags
  end