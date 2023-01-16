class CountryFacade

  def self.country_name
    CountryService.generate_country.sample[:name][:common]
  end
end