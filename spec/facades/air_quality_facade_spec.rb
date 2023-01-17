require 'rails_helper'

RSpec.describe AirQualityFacade, :vcr do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Unsplash API' do
        air_quality = AirQualityFacade.quality_search("Mexico")
        expect(air_quality).to be_a Array
        expect(air_quality.aqi).to eq(5)
        expect(air_quality.readable_aqi).to eq(Very Poor)
        expect(air_quality.lat).to eq(19.43)
        expect(air_quality.lon).to eq(-99.13)
      end
    end
  end
end