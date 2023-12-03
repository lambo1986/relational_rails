require "rails_helper"

RSpec.describe "#edit page for synth", type: :feature do
  it "has a link to the #edit page" do
    musician = Musician.create!(name: "Moby")
    synth = musician.synthesizers.create!(brand: "Roland", name: "Junio")

    visit "/synthesizers/#{synth.id}"

    click_link("Edit #{synth.name}")

    expect(current_path).to eq("/synthesizers/#{synth.id}/edit")
  end

  it "has a button to update specs and reroute to show page" do
    musician = Musician.create!(name: "Moby")
    synth = musician.synthesizers.create!(brand: "Roland", name: "Junio")

    visit "/synthesizers/#{synth.id}/edit"

    fill_in("Name", with: "Juno")
    click_button("Update #{synth.name}")

    expect(current_path).to eq("/synthesizers/#{synth.id}/")
    expect(page).to have_content("Juno")
  end
end
