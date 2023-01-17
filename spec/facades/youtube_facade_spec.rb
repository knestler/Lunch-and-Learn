require 'rails_helper'

RSpec.describe YoutubeFacade do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Country API', :vcr do
        connection = YoutubeFacade.youtube_search("Mexico")
        expect(connection).to be_a Array
        expect(connection[0].title).to eq('A Super Quick History of Mexico')
        expect(connection[0].country).to eq('Mexico')
      end
    end
  end
end