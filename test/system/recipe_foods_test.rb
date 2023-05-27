require 'application_system_test_case'

class RecipeFoodsTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    login_as(@user, scope: :user)
    visit '/general_shopping_list'
  end

  test 'Should display a table with columns (food, quantity, price)' do
    assert_text 'Food'
    assert_text 'Quantity'
    assert_text 'Price'
  end
  test 'Should display the amount of food items to buy' do
    assert_text 'Amount of food items to buy: 3'
  end
  test 'Should display the total value of food needed' do
    assert_text 'Total value of food needed: $15'
  end
  test 'Should display recipe foods of each shopping list with the total quantity and price for each' do
    shopping_list = []
    @user.recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        existing_food = shopping_list.find { |element| element.food.name == recipe_food.food.name }
        if existing_food.nil?
          shopping_list.push(recipe_food)
          assert_text recipe_food.food.name
        end
      end
    end
  end
end
