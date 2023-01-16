class YoutubeService        
  def self.youtube_search(country)
    response = conn.get('/youtube/v3/search', q: country)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://youtube.googleapis.com') do |f|
      f.params['key'] = ENV['youtube_api_key']
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['part'] = 'snippet'
      f.params['maxResults'] = 1
      
    end
  end

end