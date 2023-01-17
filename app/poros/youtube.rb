class Youtube
  attr_reader :title, 
              :youtube_video_id, 
              :country

  def initialize(title, video, country)
    @title = title
    @youtube_video_id = video
    @country = country
  end
end