require 'rails_helper'

RSpec.describe CountryService do 
  describe 'it connects to api and instatiates the facade' do 
    it 'can reach the api' do
      json_response = File.open('./spec/fixtures/country_fixture.json')
      stub_request(:any, 'https://restcountries.com/v3.1/name/Mexico')
        .to_return(status: 200, body: json_response)
      
      response = CountryService.country_given("Mexico")
      expect(response).to be_a Array
      expect(response[0]).to be_a Hash
      expect(response[0]).to have_key :name
      expect(response[0]).to have_key :capital
      expect(response[0]).to have_key :region
    end

    it 'generates a random country sample' do 
      json_response = File.open('./spec/fixtures/country_fixture.json')
      stub_request(:any, 'https://restcountries.com/v3.1/all')
        .to_return(status: 200, body: json_response)
      response = CountryService.generate_country
      expect(response).to be_a Array
      expect(response[0]).to be_a Hash
      expect(response[0]).to have_key :name
      expect(response[0]).to have_key :capital
      expect(response[0]).to have_key :region

    end
  end
end