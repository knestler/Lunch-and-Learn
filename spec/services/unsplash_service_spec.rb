require 'rails_helper'

RSpec.describe UnsplashService do 
  describe 'it connects to api and instatiates the facade' do 
    it 'can reach the api' do
      VCR.use_cassette("unsplash_service_by_country") do 
        response = UnsplashService.unsplash_search("Laos")
        expect(response).to be_a Hash
        expect(response).to have_key(:results)
        expect(response[:results][0]).to have_key(:alt_description)
        expect(response[:results][0]).to have_key(:urls)
        expect(response[:results][0][:urls]).to be_a Hash
        expect(response[:results][0][:urls]).to have_key(:raw)
        expect(response[:results][0][:urls][:raw]).to be_a String
        expect(response[:results][0][:urls][:raw]).to eq("https://images.unsplash.com/photo-1610974046321-d346b59735b3?ixid=MnwzOTk4MzB8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8fHx8MTY3MzkwODQzOA&ixlib=rb-4.0.3")
        expect(response.count).to be < 11
      VCR.eject_cassette
      end
    end
  end
end