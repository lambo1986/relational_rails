require "rails_helper"

RSpec.describe "musicians edit", type: :feature do
  it "can change attribues of the musician and link to edit" do
    musician = Musician.create!(name: "Squarepusher")

    visit("/musicians")

    click_link "Edit #{musician.name}"
    expect(current_path).to eq("/musicians/#{musician.id}/edit")
  end

  it "can edit the musician" do
    musician = Musician.create!(name: "Squarepushe")

    visit("/musicians/#{musician.id}/edit")

    fill_in("Name", with: "Squarepusher")
    click_button("Update #{musician.name}")

    expect(current_path).to eq("/musicians/#{musician.id}")
    expect(page).to have_content("Squarepusher")
  end
end
