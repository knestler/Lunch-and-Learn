require 'rails_helper'

RSpec.describe RecipeFacade do
  describe 'class methods' do
    describe '.conn' do
      it 'connects with the Recipe API', :vcr do
        connection = RecipeFacade.recipe_info("Mexico")
        expect(connection).to be_a Array
        expect(connection[0].title).to eq('Avocado from Mexico, Orange and Watercress Salad. Adapted from Chef Richard Sandoval, New York, Mexico and Dubai')
        expect(connection[0].country).to eq('Mexico')

      end
    end
  end
end