class YoutubeFacade

  def self.youtube_search(country)
    YoutubeService.youtube_search(country)[:items].map do |item|
      Youtube.new(item[:snippet][:title], item[:id][:videoId], country)
    end
  end
end
