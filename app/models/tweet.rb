module Tweet

  def self.get_mood(handle)
    begin
      tweets = get_tweets(handle)
      mood(tweets)
    rescue
      false
    end
  end

  private
    def self.get_tweets(handle)
      options = { count: 200, include_rts: false }

      if $client.user(handle)
        $client.user_timeline(handle, options).map {|t| t.full_text.downcase } 
      end
    end

    def self.mood(tweet_texts)
      text = tweet_texts.join(' ')
      happy = 0
      sad = 0

      HAPPY_WORDS.each do |word|
        happy += 1 if text.include?(word)
      end

      SAD_WORDS.each do |word|
        sad += 1 if text.include?(word)
      end

      if (happy - sad).abs < 5
        :indeferent
      else
        happy > sad ? :happy : :sad
      end
    end
end