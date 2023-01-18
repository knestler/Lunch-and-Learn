class Api::V1::FavoritesController < ApplicationController
  before_action :valid_api
  
  def create
      user = User.find_by(api_key: params[:api_key])
      user.favorites.new(favorites_params).save
      render json: { "success": "Favorite added successfully" }, status: 201
      
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    render json: FavoritesSerializer.favorites(user.favorites)
  end

  private 

  def favorites_params 
    params.permit(:country, :recipe_link, :recipe_title)
  end

  def valid_api
    if !User.find_by(api_key: params[:api_key]) || !params[:api_key]
      render json: { "error": "Favorite not added, invalid API key" }, status: 401
    end
  end
end