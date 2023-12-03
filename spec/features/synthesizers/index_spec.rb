require 'rails_helper'

RSpec.describe "Synthesizers Index Page", type: :feature do
  it "when I visit '/synthesizers' I see all synths and attributes if vintage == true", type: :feature do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    synth1 = coil.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)
    synth2 = vangelis.synthesizers.create!(brand: "Moog", name: "Voyager", year: 2002, engine: "Analog", value: 4000, voice_count: 1, vintage:false)

    visit "/synthesizers"

    expect(page).to_not have_content("Vintage? false")
    expect(page).to have_content("Vintage? true")

    expect(page).to have_content(synth1.brand)
    expect(page).to have_content(synth1.name)
    expect(page).to have_content(synth1.year)
    expect(page).to have_content(synth1.engine)
    expect(page).to have_content(synth1.value)
    expect(page).to have_content(synth1.voice_count)
    expect(page).to have_content(synth1.vintage)

    expect(page).to_not have_content(synth2.name)
  end

  it 'links to each musicians show page with their attributes', type: :feature do
    coil = Musician.create!(name: "Coil", age: 42, genre: "Industrial", active: false)
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)
    synth1 = coil.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)
    synth2 = vangelis.synthesizers.create!(brand: "Moog", name: "Voyager", year: 2002, engine: "Analog", value: 4000, voice_count: 1, vintage:false)

    visit "/synthesizers/#{synth1.id}"
    expect(page).to have_content(synth1.brand)
    expect(page).to have_content(synth1.name)
    expect(page).to have_content(synth1.year)
    expect(page).to have_content(synth1.engine)
    expect(page).to have_content(synth1.value)
    expect(page).to have_content(synth1.voice_count)
    expect(page).to have_content(synth1.vintage)

    visit "/synthesizers/#{synth2.id}"
    expect(page).to have_content(synth2.brand)
    expect(page).to have_content(synth2.name)
    expect(page).to have_content(synth2.year)
    expect(page).to have_content(synth2.engine)
    expect(page).to have_content(synth2.value)
    expect(page).to have_content(synth2.voice_count)
    expect(page).to have_content(synth2.vintage)
  end

  it "can be visited from any page on the site", type: :feature do
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)
    synth1 = vangelis.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)

    visit "/"
    click_on "List of Synths"

    visit "/musicians"
    click_on "List of Synths"

    visit "/synthesizers"
    click_on "List of Synths"

    visit "/musicians/#{vangelis.id}"
    click_on "List of Synths"

    visit "/synthesizers/#{synth1.id}"
    click_on "List of Synths"

    visit "/musicians/#{synth1.musician_id}/synthesizers"
    click_on "List of Synths"

    expect(current_path).to eq("/synthesizers/")
  end
end
