require 'rails_helper'

RSpec.describe RecipeService do 
  describe 'it connects to api' do 
    it 'can reach the api' do
      VCR.use_cassette("recipe_service_by_country") do 
        recipe_service = RecipeService.recipe_search("Mexico")
      
        response = RecipeService.recipe_search("Mexico")
        expect(response[:hits]).to be_a Array
        expect(response[:hits][0]).to have_key :recipe
        expect(response.count).to eq 5
      end

    end
  end
end