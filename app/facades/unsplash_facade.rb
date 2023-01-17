class UnsplashFacade
  def self.unsplash_images(country)
    UnsplashService.unsplash_search(country)[:results].map do |image|
      Unsplash.new(image[:alt_description], image[:urls][:raw], country)
    end
  end
end
