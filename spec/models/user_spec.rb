require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    it 'Ensure name presence' do
      user = User.new(email: 'amenior06@gmail.com')
      expect(user).to_not be_valid
    end
    it 'Ensure email presence' do
      user = User.new(name: 'Amen')
      expect(user).to_not be_valid
    end
    it 'Ensure password presence' do
      user = User.new(password: '123456')
      expect(user).to_not be_valid
    end
    it 'Should save successfully' do
      user = User.new(name: 'Amen', email: 'amenior06@gmail.com', password: '123456')
      expect(user).to be_valid
    end
  end
  context 'Association tests' do
    it 'Should have many recipes' do
      user = User.reflect_on_association(:recipes)
      expect(user.macro).to eq(:has_many)
    end
  end
end
