require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset("apparel1.jpg"),
      quantity: 10,
      price: 64.99,
    )
  end

  scenario "You are able to see product details" do
    visit root_path
    click_on "Details"
    visit "/products/1"
    page.has_content?("Name")
    page.has_content?("Description")
    page.has_content?("Quantity")
    page.has_content?("Price")
    # save_screenshot
  end
end
