class LearningResourcesSerializer
  def self.resources_finder(youtube, unsplash, country)
    {
      data: { 
        id: "null",
        type: "learning_resource",
        attributes: {
          country: country,
          video:
              {
              title: youtube.first.title,
              youtube_video_id: youtube.first.youtube_video_id,
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