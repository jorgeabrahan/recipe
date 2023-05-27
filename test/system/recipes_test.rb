require 'application_system_test_case'

class RecipesTest < ApplicationSystemTestCase
  def setup
    user = users(:one)
    @recipes = user.recipes
    login_as(user, scope: :user)
    visit recipes_path
  end

  test 'Should display the recipe name of the logged in user recipes' do
    @recipes.each do |recipe|
      assert_text recipe.name
    end
  end
  test 'Should display the recipe description of the logged in user recipes' do
    @recipes.each do |recipe|
      assert_text recipe.description
    end
  end
  test 'Should display a link to add a new recipe that should redirect to new recipe path' do
    click_link 'Add a new recipe'
    assert_current_path new_recipe_path
  end
end
