class CountryService        
  def self.conn
    Faraday.new(url: 'https://restcountries.com') 
  end

  def self.country_given(country)
    response = conn.get("/v3.1/name/#{country}")
    JSON.parse(response.body,symbolize_names: true) 
  end

  def self.generate_country
     response = conn.get('/v3.1/all')
     JSON.parse(response.body,symbolize_names: true)
  end
end
