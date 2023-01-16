require 'rails_helper'

RSpec.describe YoutubeService do 
  describe 'it connects to api and instatiates the facade' do 
    it 'can reach the api' do
      VCR.use_cassette("youtube_service_by_country") do 
        response = YoutubeService.youtube_search("Laos")
        expect(response).to be_a Hash
        expect(response[:items][0]).to have_key(:id)
        expect(response[:items][0][:id]).to be_a Hash
        expect(response[:items][0][:id]).to have_key(:videoId)
        expect(response[:items][0][:id][:videoId]).to be_a String
        expect(response[:items][0][:id][:videoId]).to eq("uw8hjVqxMXw")
        expect(response[:items][0][:snippet]).to have_key(:title)
        expect(response[:items][0][:snippet][:title]).to be_a String
        expect(response[:items][0][:snippet][:title]).to eq("A Super Quick History of Laos")
      end
    end
  end
end