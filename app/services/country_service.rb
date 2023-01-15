class CountryService        
  def self.conn
    Faraday.new("https://restcountries.com") 
  end
  
  def self.variable1(name)
    response = conn.get("/v3.1/name/#{name}") 
    JSON.parse(response.body,symbolize_names: true)      
  end
end
