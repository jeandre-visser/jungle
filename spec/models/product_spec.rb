require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with a name, price, quantity, and category" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: 'Spruce Tree', price_cents: 1000, quantity: 1, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: nil, price_cents: 1000, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "is not valid without a price" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: 'Spruce Tree', price_cents: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "is not valid without a quantity" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: 'Spruce Tree', price_cents: 1000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "is not valid without a category" do
      @category = Category.new(name: 'Trees')
      @product = Product.new(name: 'Spruce Tree', price_cents: 1000, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
