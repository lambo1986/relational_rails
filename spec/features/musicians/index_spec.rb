require 'rails_helper'

RSpec.describe 'Musicians Index' do
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
end
