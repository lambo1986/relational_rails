require 'rails_helper'

RSpec.describe 'Musicians Index', type: :feature do
  it 'shows the name of each musician' do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")

    visit "/musicians"

    expect(page).to have_content(coil.name)
    expect(page).to have_content(vangelis.name)
  end

  it 'links to each musicians show page with their attributes', type: :feature do
    coil = Musician.create!(name: "Coil", age: 42, genre: "Industrial", active: false)
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)

    visit "/musicians/#{coil.id}"
    expect(page).to have_content(coil.name)
    expect(page).to have_content(coil.age)
    expect(page).to have_content(coil.genre)
    expect(page).to have_content(coil.active)

    visit "/musicians/#{vangelis.id}"
    expect(page).to have_content(vangelis.name)
    expect(page).to have_content(vangelis.age)
    expect(page).to have_content(vangelis.genre)
    expect(page).to have_content(vangelis.active)
  end

  describe 'order musicians by date created', type: :feature do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    bjork = Musician.create!(name: "Bjork")
    nin = Musician.create!(name: "Trent Reznor")
    sw = Musician.create!(name: "Stevie Wonder")

    let(:this) {coil.name}
    let(:that) {sw.name}

    it 'shows each musician sorted by date created and displays that time', type: :feature do

      visit "/musicians"
      expect(page).to have_content(coil.created_at)
      expect(page).to have_content(vangelis.created_at)
      expect(page).to have_content(bjork.created_at)
      expect(page).to have_content(nin.created_at)
      expect(page).to have_content(sw.created_at)

      expect(this).to appear_before(that)
    end
  end

  it "shows count of musician's synths when visiting musician's #show page", type: :feature do
    coil = Musician.create!(name: "Coil")
    synth1 = coil.synthesizers.create!(brand: "Moog", name: "Mother32")
    synth2 = coil.synthesizers.create!(brand: "Roland", name: "M800")
    synth3 = coil.synthesizers.create!(brand: "Moog", name: "Subp")

    visit "/musicians/#{coil.id}"
    expect(page).to have_content(coil.synthesizers.count)
  end

  it "can be visited from any page on the site", type: :feature do
    vangelis = Musician.create!(name: "Vangelis", age: 79, genre: "Film", active: false)
    synth1 = vangelis.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)

    visit "/"
    click_on "List of Musicians"

    visit "/musicians"
    click_on "List of Musicians"

    visit "/synthesizers"
    click_on "List of Musicians"

    visit "/musicians/#{vangelis.id}"
    click_on "List of Musicians"

    visit "/synthesizers/#{synth1.id}"
    click_on "List of Musicians"

    visit "/musicians/#{synth1.musician_id}/synthesizers"
    click_on "List of Musicians"

    expect(current_path).to eq("/musicians/")
  end
end
