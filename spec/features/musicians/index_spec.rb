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
    expect(page).to have_content("Active? No")

    visit "/musicians/#{vangelis.id}"
    expect(page).to have_content(vangelis.name)
    expect(page).to have_content(vangelis.age)
    expect(page).to have_content(vangelis.genre)
    expect(page).to have_content("Active? No")
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

  it "has a button under each musician that will destroy the musician" do
    musician = Musician.create!(name: "Prodigy")

    visit "/musicians"
    click_button("Delete #{musician.name}")

    expect(current_path).to eq("/musicians")
    expect(page).to_not have_content(musician.name)
  end

  describe "order musicians by synth count" do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    bjork = Musician.create!(name: "Bjork")
    synth1 = bjork.synthesizers.create!(brand: "Roland", name: "Juno-6", year: 1982, engine: "Analog", value: 2000, voice_count: 6, vintage:true)
    synth2 = coil.synthesizers.create!(brand: "Moog", name: "Voyager", year: 2002, engine: "Analog", value: 4000, voice_count: 1, vintage:false)
    synth3 = vangelis.synthesizers.create!(brand: "Yamaha", name: "M65", year: 1976, engine: "Analog", value: 2000, voice_count: 8, vintage:true)
    synth4 = vangelis.synthesizers.create!(brand: "Roland", name: "M5", year: 1986, engine: "Digital", value: 2000, voice_count: 8, vintage:true)

    let(:this) {vangelis.name}
    let(:that) {bjork.name}

    it "has a button to sort the page by number of synths musicians have, descending" do
      visit "/musicians"

      click_button("Sort By Most Synths")

      expect(current_path).to eq("/musicians/sort_by_synth_count")
      expect(this).to appear_before(that)
      expect(page).to have_content("Number of Favorite Synths: 2")
    end
  end

  it "has a form to search for the specific name of a musician and match it" do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    bjork = Musician.create!(name: "Bjork")

    visit "/musicians"

    fill_in("Search", with: "Bjork")
    click_button("Go")

    expect(current_path).to eq("/musicians/search")
    expect(page).to have_content("Bjork")
    expect(page).to_not have_content("Coil")
  end
end
