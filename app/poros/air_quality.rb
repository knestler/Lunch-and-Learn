class AirQuality
  attr_reader :lat, 
              :lon, 
              :country

  def initialize(country)
    @lat = country[:coords][:lat]
    @lon = country[:coords][:lon]
    @country = country
  end
end