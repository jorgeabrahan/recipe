class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy, foreign_key: 'food_id'

  validates :name, presence: true, length: { maximum: 100 }
  validates :measurement_unit, presence: true, length: { maximum: 100 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
