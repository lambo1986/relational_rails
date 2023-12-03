require "rails_helper"

RSpec.describe "synthesizer show page", type: :feature do
  it "displays synthesizer from id number in URI" do
    musician = Musician.create!(name: "Moby")
    synth = musician.synthesizers.create!(brand: "Roland", name: "Junio")

    visit "/synthesizers/#{synth.id}"

    expect(page).to have_content(synth.brand)
    expect(page).to have_content(synth.name)
  end

  it "can destroy a synthesizer" do
    musician = Musician.create!(name: "NIN")
    synth = musician.synthesizers.create!(brand: "Moog", name: "One")

    visit "/synthesizers/#{synth.id}"
    click_link("Delete #{synth.name}")

    expect(current_path).to eq("/synthesizers")
    expect(page).to_not have_content("Moog One")
  end
end
