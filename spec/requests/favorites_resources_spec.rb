require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  describe "create", vcr: { record: :new_episodes } do
    it "returns http created on successful favorite creation" do
      valid_user = User.create!(name: "Jane Doe", email: "Jane.Doe@gmail.com", api_key: "bku6r7fvgo877")
      valid_params = { api_key: "bku6r7fvgo877", country: "Mexico", recipe_link: "https://www.taco.com", recipe_title: "Cassava Flour Tacos"}
      
      post "/api/v1/favorites", params: valid_params
      # require 'pry'; binding.pry
      expect(response).to have_http_status(201)
    end

    it "wrong api key error" do
      valid_user = User.create!(name: "Jane Doe", email: "Jane.Doe@gmail.com", api_key: "bku6r7fvgo877")
      valid_params = { api_key: "100bku6r7fvgo877", country: "Mexico", recipe_link: "https://www.taco.com", recipe_title: "Cassava Flour Tacos"}
      
      post "/api/v1/favorites", params: valid_params
      expect(response).to have_http_status(401)
    end
  end

  describe 'index', vcr: { record: :new_episodes } do
    before :each do
      @user1 = User.create!(name: "Jane Doe", email: "jane.doe@gmail.com", api_key: "i86tbgugfbuknli")
      @user2 = User.create!(name: "Sam Smith", email: "sam@gmail.com",  api_key: "sfdhj92rejkhfhi")
      @favorite1 = Favorite.create!(user_id: @user1.id, country: "Mexico", recipe_link: "https://www.taco.com", recipe_title: "Cassava Flour Tacos")
      @favorite2 = Favorite.create!(user_id: @user1.id, country: "United States", recipe_link: "https://www.pie.com", recipe_title: "Apple Pie")
    end

    it 'the api_key is valid, returns all recipes that the user has favorited' do
      get "/api/v1/favorites", params: { api_key: @user1.api_key }

      expect(response).to have_http_status(201)
      favorites = JSON.parse(response.body, symbolize_names: true)
      expect(favorites).to be_a(Hash)
      expect(favorites).to have_key(:data)
      expect(favorites[:data]).to be_a(Array)
      expect(favorites[:data][0][:id]).to be_a(Integer)
      expect(favorites[:data][0][:type]).to eq("favorite")
      expect(favorites[:data][0][:attributes]).to be_a(Hash)
      expect(favorites[:data][0][:attributes][:recipe_link]).to be_a(String)
      expect(favorites[:data][0][:attributes][:recipe_title]).to be_a(String)
      expect(favorites[:data][0][:attributes][:country]).to be_a(String)
    end

    
    it 'api_key is invalid' do
      get "/api/v1/favorites", params: { api_key: "" }
      
      expect(response).to have_http_status(401)
      
      error_message = JSON.parse(response.body, symbolize_names: true)
      
      expect(error_message).to be_a(Hash)
      expect(error_message).to have_key(:error)
      expect(error_message[:error]).to eq("Favorite not added, invalid API key")
    end
    
    it 'user has not favorited any recipes' do
      get "/api/v1/favorites", params: { api_key: @user2.api_key }
    
      expect(response).to have_http_status(201)
    
      favorites = JSON.parse(response.body, symbolize_names: true)
    
      expect(favorites).to be_a(Hash)
      expect(favorites).to have_key(:data)
      expect(favorites[:data].empty?).to eq(true)
    end
  end
end
