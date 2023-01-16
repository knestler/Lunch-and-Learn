class Api::V1::LearningResourcesController < ApplicationController
  def index
    # if params[:country].nil?
    #   country = CountryFacade.generate_country
    # else 
    #   country = params[:country]
    # end
    
    new_recipes = LearningResourcesFacade.resource_info(country)
    # ### get info from facade above ==> out by serializer below
    render json: LearningResourcesSerializer.resources_finder(resources)
  end


  
end

