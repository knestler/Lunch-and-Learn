class UnsplashService        
  def self.unsplash_search(country)
    response = conn.get('/search/photos/', query: country)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
      f.params['per_page'] = 10
      f.params['page'] = 1
    end
  end

end