module HashtagCollector

  def parse_hashtags(peep)
    text = peep.text.scan(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i).flatten!
    store_hashtags(text)
    render_hashtags(peep)
  end

  private

    def store_hashtags(text)
      if text 
        text.map { |e| hashtag = Hashtag.first_or_create(:name => e); 
        @peep.hashtags << hashtag }
      end
    end

    def render_hashtags(peep)
      peep.hashtags.each { |h| peep.text = @peep.text.gsub(/\#(#{h.name})/, "<a href='/hashtags/search/#{h.id}'>##{h.name}</a>") } 
      peep.save!
    end

end