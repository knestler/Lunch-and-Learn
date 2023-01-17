class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country].nil?
      country = CountryFacade.country_name
    else 
      country = params[:country]
    end

    youtube = YoutubeFacade.youtube_search(params[:country])
    unsplash =  UnsplashFacade.unsplash_images(params[:country])

    # ### get info from facade above ==> out by serializer below
    render json: LearningResourcesSerializer.resources_finder(youtube, unsplash, params[:country])
  end


  
end

