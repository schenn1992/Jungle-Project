class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  
  def show
    @products = Product.count
    @categories = Category.count
    @apparel = Category.find(id=1)
    @electronics = Category.find(id=2)
    @furniture = Category.find(id=3)
  end
end
