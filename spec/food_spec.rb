require 'spec_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @not_valid_food = Food.new
    @user = User.new(name: 'Juan')
    @food = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 2)
  end
end
