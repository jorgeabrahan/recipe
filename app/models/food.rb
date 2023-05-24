class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, foreign_key: 'food_id'
end
