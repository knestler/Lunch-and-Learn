require 'rails_helper'

RSpec.describe UnsplashFacade do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Unsplash API', :vcr do
        images = UnsplashFacade.unsplash_images("Mexico")
        expect(images).to be_a Array
        expect(images[0].alt_tag).to eq('people standing on corner road near concrete buildings during daytime')
        expect(images[0].url).to eq('https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?ixid=MnwzOTk4MzB8MHwxfHNlYXJjaHwxfHxNZXhpY298ZW58MHx8fHwxNjczOTA4MTcx&ixlib=rb-4.0.3')
        expect(images[0].country).to eq('Mexico')
        expect(images.count).to be < 11
      end
    end
  end
end