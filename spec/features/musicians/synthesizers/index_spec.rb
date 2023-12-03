require 'rails_helper'

RSpec.describe "Musician's Synths index", type: :feature do
  coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    synth1 = coil.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)
    synth2 = vangelis.synthesizers.create!(brand: "Moog", name: "Voyager", year: 2002, engine: "Analog", value: 4000, voice_count: 1, vintage:false)
    synth4 = vangelis.synthesizers.create!(brand: "Roland", name: "M5", year: 1986, engine: "Digital", value: 2000, voice_count: 8, vintage:true)
    synth3 = vangelis.synthesizers.create!(brand: "Arp", name: "Odyssey", year: 1972, engine: "Analog", value: 3000, voice_count: 2, vintage:true)

    let(:this) {synth3.brand}
    let(:that) {synth2.brand}

  it 'shows all synthesizers for the musician, in alphabetical order' do

    visit "/musicians/#{coil.id}/synthesizers"
    expect(page).to have_content(synth1.brand)
    expect(page).to have_content(synth1.name)
    expect(page).to have_content(synth1.year)
    expect(page).to have_content(synth1.engine)
    expect(page).to have_content(synth1.value)
    expect(page).to have_content(synth1.voice_count)
    expect(page).to have_content(synth1.vintage)

    visit "/musicians/#{vangelis.id}/synthesizers"
    expect(page).to have_content(synth3.brand)
    expect(page).to have_content(synth3.name)
    expect(page).to have_content(synth2.brand)
    expect(page).to have_content(synth2.name)
    expect(page).to have_content(synth2.year)
    expect(page).to have_content(synth2.engine)
    expect(page).to have_content(synth2.value)
    expect(page).to have_content(synth2.voice_count)
    expect(page).to have_content(synth2.vintage)
    expect(this).to appear_before(that)
  end
end
