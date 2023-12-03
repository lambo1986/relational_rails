require "rails_helper"

RSpec.describe "synthesizer show page", type: :feature do
  it "displays synthesizer from id number in URI" do
    musician = Musician.create!(name: "Moby")
    synth = musician.synthesizers.create!(brand: "Roland", name: "Junio")

    visit "/synthesizers/#{synth.id}"

    expect(page).to have_content(synth.brand)
    expect(page).to have_content(synth.name)
  end
end
