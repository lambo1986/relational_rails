require 'rails_helper'

RSpec.describe 'Musicians #show', type: :feature do

  it "shows count of musician's synths when visiting musician's #show page", type: :feature do
    coil = Musician.create!(name: "Coil")
    synth1 = coil.synthesizers.create!(brand: "Moog", name: "Mother32")
    synth2 = coil.synthesizers.create!(brand: "Roland", name: "M800")
    synth3 = coil.synthesizers.create!(brand: "Moog", name: "Subp")

    visit "/musicians/#{coil.id}"
    expect(page).to have_content(coil.synthesizers.count)
  end

  it "has a link to that musician's synthesizers page" do
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)
    synth1 = vangelis.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)

    visit "/musicians/#{vangelis.id}"
    click_on "Favorite Synths of Vangelis"

    expect(current_path).to eq("/musicians/#{synth1.musician_id}/synthesizers")
  end
end
