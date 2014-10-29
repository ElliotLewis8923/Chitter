  post '/peeps' do
    text = params[:peep]
    time = Time.now
    time = time.strftime("Posted at %H:%M, on %d/%m/%Y")
    @peep = Peep.create( :user => User.get(session[:id]),
                         :user_id => session[:id],
                         :text => text,
                         :time => time)
    parse_hashtags(@peep)
    redirect to '/'
  end