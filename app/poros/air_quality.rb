class AirQuality
  attr_reader :lat, 
              :lon,
              :aqi,
              :dt,
              :readable_aqi

  def initialize(coords, aqi_dt)
    @lat = coords[:lat]
    @lon = coords[:lon]
    @aqi = aqi_dt[:main][:aqi]
    @dt = aqi_dt[:dt]
    @readable_aqi = aqi_readable
  end

  def aqi_readable
    if @aqi == 1
      "Good"
    elsif @aqi == 2
      "Fair"
    elsif @aqi == 3
      "Moderate"
    elsif @aqi == 4
      "Poor"
    else
      "Very Poor"
    end
  end
end