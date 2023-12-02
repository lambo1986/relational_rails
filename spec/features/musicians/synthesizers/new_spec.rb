require "rails_helper"

RSpec.describe "musician's synths #new", type: :feature do
  it 'links to the #new page from #index' do
    coil = Musician.create!(name: "Coil")

    visit "/musicians/#{coil.id}/synthesizers"

    click_link("Add Synth")
    expect(current_path).to eq("/musicians/#{coil.id}/synthesizers/new")
  end

  it "can create new synths" do
    coil = Musician.create!(name: "Coil")

    visit "/musicians/#{coil.id}/synthesizers/new"

    fill_in("Brand", with: "Yamaha")
    click_button("Create Synth")

    expect(current_path).to eq("/musicians/#{coil.id}/synthesizers/")
    expect(page).to have_content("Yamaha")
  end
end
