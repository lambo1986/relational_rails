require "rails_helper"

RSpec.describe "Musicians #new", type: :feature do
  it "links to the new page from the musicians index" do
    visit "/musicians"

    click_link("New Musician")
    expect(current_path).to eq("/musicians/new")
  end

  it "saves the new musician and redirects to the musicians#index" do
    visit "musicians/new"

    fill_in("Name", with: "Prince")
    click_button("New Musician")

    expect(current_path).to eq("/musicians")
    expect(page).to have_content("Prince")
  end
end
