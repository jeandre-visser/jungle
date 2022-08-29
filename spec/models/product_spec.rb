require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with a name, price, quantity, and category" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: 'Spruce Tree', price_cents: 1000, quantity: 1, category: @category)
      expect(@product).to be_valid
    end
  end
end
