require 'spec_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Juan')
    @food = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 2)
    @recipe = Recipe.new(user: @user, name: 'Recipe', preparation_time: 60, cooking_time: 140,
                         description: 'Recipe description', public: false)
    @no_quantity_recipe_food = RecipeFood.new(food: @food, recipe: @recipe)
    @recipe_food = RecipeFood.new(food: @food, recipe: @recipe, quantity: 5)
  end

  it 'Should be valid if quantity is not supplied since it has a default value' do
    expect(@no_quantity_recipe_food).to be_valid
  end
  it 'Should not be valid if recipe food quantity is less than 1' do
    @recipe_food.quantity = 0
    expect(@recipe_food).to_not be_valid
  end
  it 'Should not be valid if recipe food quantity is not a number' do
    @recipe_food.quantity = 'Hello'
    expect(@recipe_food).to_not be_valid
  end
  it 'Should be valid if data is valid and supplied' do
    expect(@recipe_food).to be_valid
  end
end
