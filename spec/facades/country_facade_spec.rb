require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Country API', :vcr do
        country = CountryFacade.country_name
        expect(country).to be_a String
      end
    end
  end
end