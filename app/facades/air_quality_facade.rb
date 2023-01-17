class AirQualityFacade

  def self.quality(country)
    CountryService.country_given(country)

    AirQualityService.quality(country)
  end
end