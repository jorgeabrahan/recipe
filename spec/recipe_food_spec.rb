require 'spec_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Juan')
    @food = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 2)
    @recipe = Recipe.new(user: @user, name: 'Recipe', preparation_time: 60, cooking_time: 140, description: 'Recipe description', public: false)
    @not_valid_recipe_food = RecipeFood.new(food: @food, recipe: @recipe)
    @recipe_food = RecipeFood.new(food: @food, recipe: @recipe, quantity: 5)
  end
end
