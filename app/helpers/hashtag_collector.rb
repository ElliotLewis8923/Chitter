module HashtagCollector

  def parse_hashtags(data)
    text = data.text.scan(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i).flatten!
    store_hashtags(text, data)
    render_hashtags(data)
  end

  private

    def store_hashtags(text, data)
      if text 
        text.map { |e| hashtag = Hashtag.first_or_create(:name => e); 
        data.hashtags << hashtag }
      end
    end

    def render_hashtags(data)
      data.hashtags.each { |e| data.text = data.text.gsub(/\#(#{e.name})/, "<a href='/hashtags/search/#{e.id}'>##{e.name}</a>") } 
      data.save!
    end

end