class AirQualitySerializer
  def self.quality_finder(quality)
    {
      data: {
        id: 'null',
        type: "air_quality",
        attributes: {
            aqi: quality.aqi,# 5
            datetime: quality.date_time, #1673971849
            readable_aqi: quality.aqi_readable #"Very Poor"
        }
      }
    }
  end
end