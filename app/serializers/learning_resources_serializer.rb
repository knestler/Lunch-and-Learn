class LearningResourcesSerializer
  def self.resources_finder(resources)
    {
      data: { 
        id: "null",
        type: "learning_resource",
        attributes: {
          country: resource.country,
          video: {
            title: 
            youtube_video_id:
          }
          image: images.map do |image|
            {
            alt_tag: image.tag
            url: image.url
            }
          end
        }
      }
    }
  end
end