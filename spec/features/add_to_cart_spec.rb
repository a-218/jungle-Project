require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
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

  scenario "They see all products" do
    # ACT
    visit root_path
    #find_link('Add', match: :first).click
    #find("fa_icon shopping-cart" match: :first).click
    # page.all('.product footer a')[0].click
     click_on('Add', match: :first)
     expect(page).to have_content('My Cart (1)')
    # DEBU
    save_screenshot
   
    # VERIFY
   
   
  end
end