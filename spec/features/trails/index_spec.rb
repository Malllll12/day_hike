require 'rails_helper'

RSpec.describe "Trails Index page" do
  it 'shows the names of all trips' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")

    visit "/trips/"
    expect(page).to have_content(rocky.name)
    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(yellowstone.name)
  end

  it 'links to show page' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")

    visit "/trips/"
    click_link rocky.name
    expect(current_path).to eq("/trips/#{rocky.id}")
  end
end
