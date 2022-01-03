require 'rails_helper'

RSpec.describe Trip do
  describe 'relationships' do
    it { should have_many :trip_trails }
    it { should have_many(:trails).through(:trip_trails)}
  end

  describe 'instance methods' do
    it '.total_distance' do
      rocky = Trip.create!(name: "Rocky Mtn National Park")
      yellowstone = Trip.create!(name: "Yellowstone National Park")
      yosemite = Trip.create!(name: "Yosemite National Park")
      flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
      waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
      cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

      rocky.trails << flower
      rocky.trails << waterfall
      rocky.trails << cliff

      expect(rocky.total_distance).to eq(6)
    end

    it '.average_distance' do
      rocky = Trip.create!(name: "Rocky Mtn National Park")
      yellowstone = Trip.create!(name: "Yellowstone National Park")
      yosemite = Trip.create!(name: "Yosemite National Park")
      flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
      waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
      cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

      rocky.trails << flower
      rocky.trails << waterfall
      rocky.trails << cliff

      expect(rocky.average_distance).to eq(2)
    end

    it '.longest_trail' do
      rocky = Trip.create!(name: "Rocky Mtn National Park")
      yellowstone = Trip.create!(name: "Yellowstone National Park")
      yosemite = Trip.create!(name: "Yosemite National Park")
      flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
      waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
      cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

      rocky.trails << flower
      rocky.trails << waterfall
      rocky.trails << cliff

      expect(rocky.longest_trail).to eq(cliff)
    end

    it '.shortest_trail' do
      rocky = Trip.create!(name: "Rocky Mtn National Park")
      yellowstone = Trip.create!(name: "Yellowstone National Park")
      yosemite = Trip.create!(name: "Yosemite National Park")
      flower = Trail.create!(name: "Flower Hike", address: "123 Here", length: 1)
      waterfall = Trail.create!(name: "Waterfall Hike", address: "123 There", length: 2)
      cliff = Trail.create!(name: "Cliff Hike", address: "222 There", length: 3)

      rocky.trails << flower
      rocky.trails << waterfall
      rocky.trails << cliff

      expect(rocky.shortest_trail).to eq(flower)
    end
  end
end
