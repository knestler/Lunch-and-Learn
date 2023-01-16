require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe '/api/v1/recipes', vcr: {record: :new_episodes}, type: :request do
    it 'returns the recipes and following info' do
      get '/api/v1/recipes', params: {country: "Mexico"}
      expect(response).to be_successful
      
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a Hash
      expect(recipes).to have_key(:data)
      expect(recipes[:data][0]).to have_key(:id)
      expect(recipes[:data][0]).to have_key(:type)
      expect(recipes[:data][0]).to have_key(:attributes)
      expect(recipes[:data][0][:attributes]).to have_key(:title)
      expect(recipes[:data][0][:attributes]).to have_key(:url)
      expect(recipes[:data][0][:attributes]).to have_key(:country)
      expect(recipes[:data][0][:attributes]).to_not have_key(:uri)
      expect(recipes[:data][0][:attributes]).to_not have_key(:yeild)
    end

    it 'returns the recipes and following info' do
      get '/api/v1/recipes', params: {country: "Kyrgyzstan"}
      expect(response).to be_successful
      
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to be_a Hash
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to eq([])
    end
  end
end
