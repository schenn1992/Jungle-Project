require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can navigate from the home page to the product detail page by clicking on a product" do

    visit root_path
    save_screenshot 'home_page.png'

    #find 'a' tag inside the first article's footer and click it
    first('article.product').find('footer').find('a').click

    path = page.current_path
    visit path
    save_screenshot 'after_details.png'

    expect(page.current_path).to include('products')

  end
end