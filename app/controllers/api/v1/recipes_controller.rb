class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].nil?
      country = CountryFacade.generate_country
    else 
      country = params[:country]
    end
    
    new_recipes = RecipeFacade.recipe_info(country)
    ### get info from facade above ==> out by serializer below
    render json: RecipeSerializer.recipe_finder(new_recipes)
  end


  
end

