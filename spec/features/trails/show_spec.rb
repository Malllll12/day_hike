require 'rails_helper'

RSpec.describe 'Trail Show page' do
 it 'shows name and address of trail' do
   rocky = Trip.create!(name: "Rocky Mtn National Park")
   yellowstone = Trip.create!(name: "Yellowstone National Park")
   yosemite = Trip.create!(name: "Yosemite National Park")
   flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
   waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
   cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

   rocky.trails << flower
   rocky.trails << waterfall
   rocky.trails << cliff

   visit "/trails/#{flower.id}"

   expect(page).to have_content(flower.name)
   expect(page).to have_content(flower.address)
 end

 it 'shows name and total length of associated hiking trips' do
   rocky = Trip.create!(name: "Rocky Mtn National Park")
   yellowstone = Trip.create!(name: "Yellowstone National Park")
   yosemite = Trip.create!(name: "Yosemite National Park")
   flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
   waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
   cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

   rocky.trails << flower
   rocky.trails << waterfall
   rocky.trails << cliff
   yellowstone.trails << flower
   yellowstone.trails << waterfall
   yosemite.trails << flower
   yosemite.trails << cliff

   visit "/trails/#{flower.id}"
   expect(page).to have_content("#{rocky.name} Total length: #{rocky.total_distance}")
   expect(page).to have_content("#{yellowstone.name} Total length: #{yellowstone.total_distance}")
   expect(page).to have_content("#{yosemite.name} Total length: #{yosemite.total_distance}")
 end

 it 'shows total count of trips the trail is included' do
   rocky = Trip.create!(name: "Rocky Mtn National Park")
   yellowstone = Trip.create!(name: "Yellowstone National Park")
   yosemite = Trip.create!(name: "Yosemite National Park")
   flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
   waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
   cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

   rocky.trails << flower
   rocky.trails << waterfall
   rocky.trails << cliff
   yellowstone.trails << flower
   yellowstone.trails << waterfall
   yosemite.trails << flower
   yosemite.trails << cliff

   visit "/trails/#{flower.id}"

   expect(page).to have_content("#{flower.trip_count} trips include this trail")
 end
end
