class AirQualityService        
  def self.conn
    Faraday.new(url: 'http://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['air_quality_api_key']
    end
  end

  def self.quality_search(lat, lon)
    response = conn.get("data/2.5/air_pollution?lat=#{lat}&lon=#{lon}", lat: (lat), lon:(lon))
    JSON.parse(response.body, symbolize_names: true)
  end
end
