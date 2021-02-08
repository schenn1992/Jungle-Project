require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'validates :name, :price, :quantity, :category presence: true' do
      @category = Category.create(name: "electronics")
      @product = Product.create(name: "USB typewriter", price: 500, quantity: 12, category: @category)

      expect(@product.name).not_to eq(nil)
      expect(@product.price).not_to eq(nil)
      expect(@product.quantity).not_to eq(nil)
      expect(@product.category).not_to eq(nil)

    end
    
    it 'validates :name, presence: true' do
      @category = Category.create(name: "electronics")
      @product = Product.create(price: 500, quantity: 12, category: @category)

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates :price, presence: true' do
      @category = Category.create(name: "electronics")
      @product = Product.create(name: "USB typewriter", quantity: 12, category: @category)

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates :quantity, presence: true' do
      @category = Category.create(name: "electronics")
      @product = Product.create(name: "USB typewriter", price: 500, category: @category)

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates :category, presence: true' do
      @category = Category.create(name: "electronics")
      @product = Product.create(name: "USB typewriter", price: 500, quantity: 12)
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end