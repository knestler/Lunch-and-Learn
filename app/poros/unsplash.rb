class Unsplash
  attr_reader :alt_tag,
              :url,
              :country

  def initialize(alt_tag, url, country)
    @alt_tag = alt_tag
    @url = url
    @country = country
  end
end