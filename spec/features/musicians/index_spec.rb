require 'rails_helper'

RSpec.describe 'Musicians Index', type: :feature do
  it 'shows the name of each musician' do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")

    visit "/musicians"

    expect(page).to have_content(coil.name)
    expect(page).to have_content(vangelis.name)
  end

  it 'links to each musicians show page with their attributes' do
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

  describe 'order musicians by date created' do
    coil = Musician.create!(name: "Coil")
    vangelis = Musician.create!(name: "Vangelis")
    bjork = Musician.create!(name: "Bjork")
    nin = Musician.create!(name: "Trent Reznor")
    sw = Musician.create!(name: "Stevie Wonder")

    let(:this) {coil.name}
    let(:that) {sw.name}

    it 'shows each musician sorted by date created and displays that time' do

      visit "/musicians"
      expect(page).to have_content(coil.created_at)
      expect(page).to have_content(vangelis.created_at)
      expect(page).to have_content(bjork.created_at)
      expect(page).to have_content(nin.created_at)
      expect(page).to have_content(sw.created_at)

      expect(this).to appear_before(that)
    end
  end
end
