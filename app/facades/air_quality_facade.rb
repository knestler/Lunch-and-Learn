class AirQualityFacade

  def self.quality_search(country)
    coords = CountryService.country_given(country)[0][:capitalInfo]
    quality = AirQualityService.quality_search(coords[:latlng][0], coords[:latlng][1])
    AirQuality.new(quality[:coord], quality[:list][0])
  end
end
