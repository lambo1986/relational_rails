require 'rails_helper'

RSpec.describe "Musician's Synths index" do
  it 'shows all synthesizers for the musician' do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    synth1 = coil.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)
    synth2 = vangelis.synthesizers.create!(brand: "Moog", name: "Voyager", year: 2002, engine: "Analog", value: 4000, voice_count: 1, vintage:false)

    visit "/musicians/#{coil.id}/synthesizers"
    expect(page).to have_content(synth1.brand)
    expect(page).to have_content(synth1.name)
    expect(page).to have_content(synth1.year)
    expect(page).to have_content(synth1.engine)
    expect(page).to have_content(synth1.value)
    expect(page).to have_content(synth1.voice_count)
    expect(page).to have_content(synth1.vintage)

    visit "/musicians/#{vangelis.id}/synthesizers"
    expect(page).to have_content(synth2.brand)
    expect(page).to have_content(synth2.name)
    expect(page).to have_content(synth2.year)
    expect(page).to have_content(synth2.engine)
    expect(page).to have_content(synth2.value)
    expect(page).to have_content(synth2.voice_count)
    expect(page).to have_content(synth2.vintage)
  end

  # it "has a link that takes the user to the synthesizers #index" do

  # end
end
