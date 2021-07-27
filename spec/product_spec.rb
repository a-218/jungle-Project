require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations of name' do
    # validation tests/examples here
    it 'shoudl validate the product' do

      category = Category.create(name:'something')
      product = Product.create(name:'test', price_cents: 30, quantity:4, category: category)
      expect(product).to be_valid
      
    end

    it 'should validate name' do

      category = Category.create(name:'something')
      product = Product.create(name:nil, price_cents: 30, quantity:4, category: category)
      expect(product.valid?).to be false
      puts product.errors.full_messages
    end
    it 'should validate price' do

      category = Category.create(name:'something')
      product = Product.create(name:'test', price_cents: nil, quantity:4, category: category)
      puts product.errors.full_messages
      expect(product.valid?).to be false
    end
    it 'should validate quantity' do

      category = Category.create(name:'something')
      product = Product.create(name:'test', price_cents: 30, quantity:nil, category: category)
      puts product.errors.full_messages
      expect(product.valid?).to be false
    end
    it 'should validate category' do

      category = Category.create(name:'something')
      product = Product.create(name:'test', price_cents: 30, quantity:4, category: nil)
      puts product.errors.full_messages
      expect(product.valid?).to be false
    end
  end
end