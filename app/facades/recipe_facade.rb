class RecipeFacade

  def self.recipe_info(country)
    RecipeService.recipe_search(country)[:hits].map do |recipe|
      hash = recipe[:recipe]
      Recipe.new(hash[:label], hash[:url], country, hash[:image])
    end
  end
end
