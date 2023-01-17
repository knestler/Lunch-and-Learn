class Api::V1::AirQualityController < ApplicationController
  def index
    if params[:country].nil?
      country = CountryFacade.country_name
    else 
      country = params[:country]
    end
    
    air_quality = AirQualityFacade.quality_search(country)
    ### get info from facade above ==> out by serializer below
    render json: AirQualitySerializer.quality_finder(air_quality)
  end


  
end
