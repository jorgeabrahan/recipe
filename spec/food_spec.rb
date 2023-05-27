require 'spec_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @not_valid_food = Food.new
    @user = User.new(name: 'Juan')
    @food = Food.new(user: @user, name: 'Apple', measurement_unit: 'grams', price: 2)
  end

  it 'Should not be valid if required data is not supplied' do
    expect(@not_valid_food).to_not be_valid
  end
  it 'Should not be valid if name has more then 100 characters' do
    @food.name = 'a' * 101
    expect(@food).to_not be_valid
  end
  it 'Should not be valid if measurement_unit has more then 100 characters' do
    @food.measurement_unit = 'a' * 101
    expect(@food).to_not be_valid
  end
  it 'Should not be valid if price is less than 1' do
    @food.price = 0
    expect(@food).to_not be_valid
  end
  it 'Should not be valid if price is not a number' do
    @food.price = 'Hello'
    expect(@food).to_not be_valid
  end
end
