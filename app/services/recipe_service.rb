class RecipeService        
  def self.recipe_search(country)
    response = conn.get('/api/recipes/v2', q: country)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['id']
      f.params['app_key'] = ENV['key']
      f.params['type'] = 'public'
    end
  end

end