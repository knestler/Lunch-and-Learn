class AirQualitySerializer
  def self.quality_finder(capital)
    {
      data: {
        id: 'null',
        type: "air_quality",
        attributes: {
            aqi: capital.aqi,# 5
            datetime: capital.dt, #1673971849
            readable_aqi: capital.readable_aqi #"Very Poor"
        }
      }
    }
  end
end