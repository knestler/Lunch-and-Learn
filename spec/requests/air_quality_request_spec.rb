require 'rails_helper'

RSpec.describe 'air quality APIs' do
  describe '/api/v1/air_quality', vcr: {record: :new_episodes}, type: :request do
    it 'returns the air quality and following info' do
      get '/api/v1/air_quality', params: {country: "India"}
      expect(response).to be_successful
      
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to have_key(:id)
      expect(air_quality[:data][:id]).to eq('null')
      expect(air_quality[:data]).to have_key(:type)
      expect(air_quality[:data][:type]).to eq('air_quality')
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes]).to have_key(:datetime)
      expect(air_quality[:data][:attributes]).to have_key(:readable_aqi)
    end
    
    it 'returns the air quality and following info' do
      get '/api/v1/air_quality', params: {country: "Kenya"}
      expect(response).to be_successful
      
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to have_key(:id)
      expect(air_quality[:data][:id]).to eq('null')
      expect(air_quality[:data]).to have_key(:type)
      expect(air_quality[:data][:type]).to eq('air_quality')
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes]).to have_key(:datetime)
      expect(air_quality[:data][:attributes]).to have_key(:readable_aqi)
    end

    it 'returns the air quality and following info' do
      get '/api/v1/air_quality', params: {country: "Peru"}
      expect(response).to be_successful
      
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to have_key(:id)
      expect(air_quality[:data][:id]).to eq('null')
      expect(air_quality[:data]).to have_key(:type)
      expect(air_quality[:data][:type]).to eq('air_quality')
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes]).to have_key(:datetime)
      expect(air_quality[:data][:attributes]).to have_key(:readable_aqi)
    end

    it 'returns the air quality and following info' do
      get '/api/v1/air_quality', params: {country: "France"}
      expect(response).to be_successful
      
      air_quality = JSON.parse(response.body, symbolize_names: true)
      expect(air_quality).to be_a Hash
      expect(air_quality).to have_key(:data)
      expect(air_quality[:data]).to have_key(:id)
      expect(air_quality[:data][:id]).to eq('null')
      expect(air_quality[:data]).to have_key(:type)
      expect(air_quality[:data][:type]).to eq('air_quality')
      expect(air_quality[:data]).to have_key(:attributes)
      expect(air_quality[:data][:attributes]).to have_key(:aqi)
      expect(air_quality[:data][:attributes]).to have_key(:datetime)
      expect(air_quality[:data][:attributes]).to have_key(:readable_aqi)
    end

  end
end