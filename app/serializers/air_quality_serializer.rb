class AirQualitySerializer
  def self.quality_finder(captial)
    {
      data: {
        id: 'null',
        type: "air_quality",
        attributes: {
            aqi: capital.aqi,# 5
            datetime: capital.date_time, #1673971849
            readable_aqi: capital.aqi_readable #"Very Poor"
        }
      }
    }
  end
end