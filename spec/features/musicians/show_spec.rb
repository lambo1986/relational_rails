require 'rails_helper'

RSpec.describe 'Musicians #show', type: :feature do
  it "has a link to that musician's synthesizers page" do
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)
    synth1 = vangelis.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)

    visit "/musicians/#{vangelis.id}"
    click_on "Favorite Synth of Vangelis"

    expect(current_path).to eq("/musicians/#{synth1.musician_id}/synthesizers")
  end
end
