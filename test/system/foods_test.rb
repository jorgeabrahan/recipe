require 'application_system_test_case'

class FoodsTest < ApplicationSystemTestCase
  def setup
    user = users(:one)
    @foods = user.foods
    login_as(user, scope: :user)
    visit foods_path
  end

  test 'Should display a table with columns (food, measurement unit, unit price, actions)' do
    assert_text 'Food'
    assert_text 'Measurement unit'
    assert_text 'Unit price'
    assert_text 'Actions'
  end
  test 'Should display the food name of the logged in user foods' do
    @foods.each do |food|
      assert_text food.name
    end
  end
  test 'Should display the food measurement_unit of the logged in user foods' do
    @foods.each do |food|
      assert_text food.measurement_unit
    end
  end
  test 'Should display the food price of the logged in user foods' do
    @foods.each do |food|
      assert_text food.price
    end
  end
  test 'Should display a link to add a new food that should redirect to new food path' do
    click_link 'Add Food'
    assert_current_path new_food_path
  end
end
