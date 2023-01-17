require 'rails_helper'

RSpec.describe AirQualityFacade, :vcr do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Unsplash API' do
        air_quality = AirQualityFacade.quality_search("Kenya")
        expect(air_quality).to be_a AirQuality
        expect(air_quality.aqi).to eq(2)
        expect(air_quality.readable_aqi).to eq('Fair')
        expect(air_quality.lat).to eq(-1.28)
        expect(air_quality.lon).to eq(36.82)
      end
    end
  end
end