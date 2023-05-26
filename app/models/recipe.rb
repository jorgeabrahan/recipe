class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, foreign_key: 'recipe_id'

  def total_price
    total_price = 0
    recipe_foods.each do |recipe_food|
      total_price += recipe_food.food.price * recipe_food.quantity
    end
    total_price
  end
end
