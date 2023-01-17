class LearningResourcesSerializer
  def self.resources_finder(youtube, unsplash, country)
    {
      data: { 
        id: "null",
        type: "learning_resource",
        attributes: {
          country: country,
          video: {
            title: youtube,
            youtube_video_id: youtube,
          },
          images: unsplash.map do |image|
            {
            alt_tag: image.alt_tag,
            url: image.url,
            }
          end
        }
      }
    }
  end
end