require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: "test-category")
      @category.save
    end

    it "creates a product with a name, price, quantity, and category_id" do
      @product = Product.new({
        name: "test-product",
        price: 50,
        quantity: 50,
        category_id: @category[:id],
      })
      @product.save
      expect(@product).to be_present
    end

    it "should not create a product without a name" do
      @product = Product.new({
        name: nil,
        price: 50,
        quantity: 50,
        category_id: @category[:id],
      })
      @product.save
      expect(@product.name).to_not be_present
      expect(@product.errors.full_messages.include?("Name cannot be blank")).to be_truthy
    end

    it "should not create a product without a price" do
      @product = Product.new({
        name: "test-product",
        price: nil,
        quantity: 50,
        category_id: @category[:id],
      })
      @product.save

      expect(@product.price).to_not be_present
      expect(@product.errors.full_messages.include?("Price cents is not a number" || "Price is not a number" || "Price cannot be blank")).to be_truthy
    end

    it "should not create a product without a quantity" do
      @product = Product.new({
        name: "test-product",
        price: 50,
        quantity: nil,
        category_id: @category[:id],
      })
      @product.save
      expect(@product.quantity).to_not be_present
      expect(@product.errors.full_messages.include?("Quantity cannot be blank")).to be_truthy
    end

    it "should not create a product without a category" do
      @product = Product.new({
        name: "test-product",
        price: 50,
        quantity: 50,
        category_id: nil,
      })
      @product.save
      expect(@product.category_id).to_not be_present
      expect(@product.errors.full_messages.include?("Category cannot be blank")).to be_truthy
    end

  end
end 