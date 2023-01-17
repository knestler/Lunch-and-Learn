require 'rails_helper'

RSpec.describe 'learning reseources APIs' do
  describe '/api/v1/learning_resources', vcr: {record: :new_episodes}, type: :request do
    it 'returns the learning resources and following info' do
      get '/api/v1/learning_resources', params: {country: "Mexico"}
      expect(response).to be_successful
      
      media = JSON.parse(response.body, symbolize_names: true)
      expect(media).to be_a Hash
      expect(media).to have_key(:data)
      expect(media[:data]).to have_key(:id)
      expect(media[:data][:id]).to eq('null')
      expect(media[:data]).to have_key(:type)
      expect(media[:data][:type]).to eq('learning_resource')
      expect(media[:data]).to have_key(:attributes)
      expect(media[:data][:attributes]).to have_key(:country)
      expect(media[:data][:attributes]).to have_key(:video)
      expect(media[:data][:attributes][:video]).to have_key(:title)
      expect(media[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(media[:data][:attributes]).to have_key(:images)
      expect(media[:data][:attributes][:images][0]).to have_key(:alt_tag)
      expect(media[:data][:attributes][:images][0]).to have_key(:url)
      expect(media[:data][:attributes][:images].count <= 10).to be true
    end

    it 'returns media from randomly generated country' do
      get '/api/v1/learning_resources', params: {country: nil}
      expect(response).to be_successful
      
      media = JSON.parse(response.body, symbolize_names: true)
      expect(media).to be_a Hash
      expect(media).to have_key(:data)
      expect(media[:data]).to_not be_empty
    end
  end
end
