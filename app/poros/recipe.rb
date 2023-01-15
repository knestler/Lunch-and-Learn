class Recipe
  attr_reader :title, 
              :url, 
              :country, 
              :image

  def initialize(label, url, country, image)
    @title = label
    @url = url
    @country = country
    @image = image
  end
end