class Youtube
  attr_reader :title, 
              :video, 
              :country

  def initialize(title, video, country)
    @title = title
    @video = video
    @country = country
  end
end