class Api::V1::RecipesController < ApplicationController
  def index
    new_recipies = RecipeFacade.recipe_info(params[:country])
    ### get info from facade above ==> out by serializer below
    render json: RecipeSerializer.recipe_finder(new_recipies)
  end
end

