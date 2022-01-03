require 'rails_helper'

RSpec.describe 'Trips Show page' do
  it 'lists trails on the trip' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    expect(page).to have_content(flower.name)
    expect(page).to have_content(flower.address)
    expect(page).to have_content(waterfall.name)
    expect(page).to have_content(waterfall.length)
    expect(page).to have_content(cliff.name)
    expect(page).to have_content(cliff.address)
  end

  it 'shows the total hiking trips' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    expect(page).to have_content("Total Hiking Distance: 6 miles")
  end

#   User Story 5 of 10
#
# As a visitor,
# when I visit a hiking trip's page,
# I see the average hiking distance
# of all trails on that hiking trip
  it 'shows average hiking distance' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    expect(page).to have_content("Average Distance: 2.0 miles")
  end

  it "shows the longest trail on the trip" do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    expect(page).to have_content("Longest Trail on Trip: #{cliff.name} at #{cliff.length} miles")
  end

  it "shows the shortest trail on the trip" do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    expect(page).to have_content("Shortest Trail on Trip: #{flower.name} at #{flower.length} miles")
  end

  it 'redirects to the trails show page' do
    rocky = Trip.create!(name: "Rocky Mtn National Park")
    yellowstone = Trip.create!(name: "Yellowstone National Park")
    yosemite = Trip.create!(name: "Yosemite National Park")
    flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
    waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
    cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

    rocky.trails << flower
    rocky.trails << waterfall
    rocky.trails << cliff

    visit "/trips/#{rocky.id}"

    click_link flower.name

    expect(current_path).to eq("/trails/#{flower.id}")
  end
end
